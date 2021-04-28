/*
 * (C) Copyright 2020 - 2021 Xilinx, Inc.
 * SPDX-License-Identifier: Apache-2.0
 */

pipeline {
    agent {
        label 'Build_Master'
    }
    environment {
        deploy_branch="2021.1"
        tool_release="2021.1"
        tool_build="daily_latest"
        auto_branch="2021.1"
        pfm_ver="202110_1"
        setup="${WORKSPACE}/paeg-helper/env-setup.sh"
        lsf="${WORKSPACE}/paeg-helper/scripts/lsf"
        DEPLOYDIR="/wrk/paeg_builds/build-artifacts/vck190-base-trd/${tool_release}"
    }
    options {
        // don't let the implicit checkout happen
        skipDefaultCheckout true
    }
    triggers {
        cron(env.BRANCH_NAME == '2021.1' ? 'H 21 * * *' : '')
    }
    stages {
        stage ('Fix Changelog') {
            // only do this if there is no prior build
            when {
                expression {
                    return !currentBuild.previousBuild
                }
            }
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: scm.branches,
                    userRemoteConfigs: scm.userRemoteConfigs,
                    // this extension builds the changesets from the compareTarget branch
                    extensions:
                    [
                        [$class: 'ChangelogToBranch', options:
                              [compareRemote: 'origin', compareTarget: env.tool_release]
                        ]
                    ]
                ])
            }
        }
        stage('Clone Repos') {
            steps {
                // checkout main source repo
                checkout([
                    $class: 'GitSCM',
                    branches: scm.branches,
                    doGenerateSubmoduleConfigurations: scm.doGenerateSubmoduleConfigurations,
                    extensions: scm.extensions + [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'src']],
                    userRemoteConfigs: scm.userRemoteConfigs
                ])
                // checkout paeg-automation helper repo
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: auto_branch]],
                    doGenerateSubmoduleConfigurations: false,
                    extensions:
                    [
                        [$class: 'CleanCheckout'],
                        [$class: 'RelativeTargetDirectory', relativeTargetDir: 'paeg-helper']
                    ],
                    submoduleCfg: [],
                    userRemoteConfigs: [[
                        credentialsId: '01d4faf7-fb5a-4bd9-b300-57ac0bfc7991',
                        url: 'https://gitenterprise.xilinx.com/PAEG/paeg-automation.git'
                    ]]
                ])
            }
        }
        stage('Vitis Builds') {
            parallel {
                stage('vck190_es1_hdmiRx_hdmiTx') {
                    environment {
                        pfm_base="vck190_es1_hdmiRx_hdmiTx"
                        pfm="xilinx_${pfm_base}_${pfm_ver}"
                        pfm_dir="${WORKSPACE}/src/platforms/${pfm}"
                        xpfm="${pfm_dir}/${pfm_base}.xpfm"
                        work_dir="work_${pfm}"
                    }
                    stages {
                        stage('vck190_es1_hdmiRx_hdmiTx platform build')  {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/platforms/vivado/vck190_es1_hdmiRx_hdmiTx/**"
                                    triggeredBy 'TimerTrigger'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_ES1_HDMI_F2D = '1'
                                }
                                sh label: 'platform build',
                                script: '''
                                    pushd src
                                    source ${setup} -r ${tool_release} && set -e
                                    ${lsf} make platform PFM=${pfm_base} JOBS=32
                                    popd
                                '''
                            }
                            post {
                                success {
                                    sh label: 'platform deploy',
                                    script: '''
                                        if [ "${BRANCH_NAME}" == "${deploy_branch}" ]; then
                                            pushd src
                                            mkdir -p ${DEPLOYDIR}
                                            cp -rf platforms/${pfm} ${DEPLOYDIR}
                                            popd
                                        fi
                                    '''
                                }
                            }
                        }
                        stage('filter2d_combined overlay build') {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                                example_dir="${work_dir}/overlays/examples/filter2d_combined"
                            }
                            when {
                                anyOf {
                                    changeset "**/overlays/examples/filter2d_*/**"
                                    triggeredBy 'TimerTrigger'
                                    environment name: 'BUILD_ES1_HDMI_F2D', value: '1'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_ES1_HDMI_PLNX = '1'
                                }
                                sh label: 'overlay build',
                                script: '''
                                    pushd src
                                    if [ -d platforms/${pfm} ]; then
                                        echo "Using platform from local build"
                                    elif [ -d ${DEPLOYDIR}/${pfm} ]; then
                                        echo "Using platform from build artifacts"
                                        ln -s ${DEPLOYDIR}/${pfm} platforms/
                                    else
                                        echo "No valid platform found: ${pfm}"
                                        exit 1
                                    fi
                                    mkdir -p ${work_dir}
                                    cp -rf overlays ${work_dir}
                                    pushd ${example_dir}
                                    source ${setup} -r ${tool_release} && set -e
                                    ${lsf} make all PLATFORM=${xpfm}
                                    popd
                                    popd
                                '''
                            }
                            post {
                                success {
                                    sh label: 'overlay deploy',
                                    script: '''
                                        if [ "${BRANCH_NAME}" == "${deploy_branch}" ]; then
                                            pushd src
                                            DST=${DEPLOYDIR}/filter2d_combined/${pfm_base}
                                            mkdir -p ${DST}
                                            cp -f ${example_dir}/binary_container_1.xsa \
                                                ${example_dir}/binary_container_1.xclbin \
                                                ${DST}
                                            popd
                                        fi
                                    '''
                                }
                            }
                        }
                    }
                }
                stage('vck190_hdmiRx_hdmiTx') {
                    environment {
                        pfm_base="vck190_hdmiRx_hdmiTx"
                        pfm="xilinx_${pfm_base}_${pfm_ver}"
                        pfm_dir="${WORKSPACE}/src/platforms/${pfm}"
                        xpfm="${pfm_dir}/${pfm_base}.xpfm"
                        work_dir="work_${pfm}"
                    }
                    stages {
                        stage('vck190_hdmiRx_hdmiTx platform build')  {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/platforms/vivado/vck190_hdmiRx_hdmiTx/**"
                                    triggeredBy 'TimerTrigger'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_HDMI_F2D = '1'
                                }
                                sh label: 'platform build',
                                script: '''
                                    pushd src
                                    source ${setup} -r ${tool_release} && set -e
                                    ${lsf} make platform PFM=${pfm_base} JOBS=32
                                    popd
                                '''
                            }
                            post {
                                success {
                                    sh label: 'platform deploy',
                                    script: '''
                                        if [ "${BRANCH_NAME}" == "${deploy_branch}" ]; then
                                            pushd src
                                            mkdir -p ${DEPLOYDIR}
                                            cp -rf platforms/${pfm} ${DEPLOYDIR}
                                            popd
                                        fi
                                    '''
                                }
                            }
                        }
                        stage('filter2d_combined overlay build') {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                                example_dir="${work_dir}/overlays/examples/filter2d_combined"
                            }
                            when {
                                anyOf {
                                    changeset "**/overlays/examples/filter2d_*/**"
                                    triggeredBy 'TimerTrigger'
                                    environment name: 'BUILD_HDMI_F2D', value: '1'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_HDMI_PLNX = '1'
                                }
                                sh label: 'overlay build',
                                script: '''
                                    pushd src
                                    if [ -d platforms/${pfm} ]; then
                                        echo "Using platform from local build"
                                    elif [ -d ${DEPLOYDIR}/${pfm} ]; then
                                        echo "Using platform from build artifacts"
                                        ln -s ${DEPLOYDIR}/${pfm} platforms/
                                    else
                                        echo "No valid platform found: ${pfm}"
                                        exit 1
                                    fi
                                    mkdir -p ${work_dir}
                                    cp -rf overlays ${work_dir}
                                    pushd ${example_dir}
                                    source ${setup} -r ${tool_release} && set -e
                                    ${lsf} make all PLATFORM=${xpfm}
                                    popd
                                    popd
                                '''
                            }
                            post {
                                success {
                                    sh label: 'overlay deploy',
                                    script: '''
                                        if [ "${BRANCH_NAME}" == "${deploy_branch}" ]; then
                                            pushd src
                                            DST=${DEPLOYDIR}/filter2d_combined/${pfm_base}
                                            mkdir -p ${DST}
                                            cp -f ${example_dir}/binary_container_1.xsa \
                                                ${example_dir}/binary_container_1.xclbin \
                                                ${DST}
                                            popd
                                        fi
                                    '''
                                }
                            }
                        }
                    }
                }
                stage('vck190_es1_mipiRxSingle_hdmiTx') {
                    environment {
                        pfm_base="vck190_es1_mipiRxSingle_hdmiTx"
                        pfm="xilinx_${pfm_base}_${pfm_ver}"
                    }
                    stages {
                        stage('vck190_es1_mipiRxSingle_hdmiTx platform build')  {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/platforms/vivado/vck190_es1_mipiRxSingle_hdmiTx/**"
                                    triggeredBy 'TimerTrigger'
                                }
                            }
                            steps {
                                sh label: 'platform build',
                                script: '''
                                    pushd src
                                    source ${setup} -r ${tool_release} && set -e
                                    ${lsf} make platform PFM=${pfm_base} JOBS=32
                                    popd
                                '''
                            }
                            post {
                                success {
                                    sh label: 'platform deploy',
                                    script: '''
                                        if [ "${BRANCH_NAME}" == "${deploy_branch}" ]; then
                                            pushd src
                                            mkdir -p ${DEPLOYDIR}
                                            cp -rf platforms/${pfm} ${DEPLOYDIR}
                                            popd
                                        fi
                                    '''
                                }
                            }
                        }
                    }
                }
                stage('vck190_mipiRxSingle_hdmiTx') {
                    environment {
                        pfm_base="vck190_mipiRxSingle_hdmiTx"
                        pfm="xilinx_${pfm_base}_${pfm_ver}"
                    }
                    stages {
                        stage('vck190_mipiRxSingle_hdmiTx platform build')  {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/platforms/vivado/vck190_mipiRxSingle_hdmiTx/**"
                                    triggeredBy 'TimerTrigger'
                                }
                            }
                            steps {
                                sh label: 'platform build',
                                script: '''
                                    pushd src
                                    source ${setup} -r ${tool_release} && set -e
                                    ${lsf} make platform PFM=${pfm_base} JOBS=32
                                    popd
                                '''
                            }
                            post {
                                success {
                                    sh label: 'platform deploy',
                                    script: '''
                                        if [ "${BRANCH_NAME}" == "${deploy_branch}" ]; then
                                            pushd src
                                            mkdir -p ${DEPLOYDIR}
                                            cp -rf platforms/${pfm} ${DEPLOYDIR}
                                            popd
                                        fi
                                    '''
                                }
                            }
                        }
                    }
                }
                stage('vck190_es1_mipiRxQuad_hdmiTx') {
                    environment {
                        pfm_base="vck190_es1_mipiRxQuad_hdmiTx"
                        pfm="xilinx_${pfm_base}_${pfm_ver}"
                    }
                    stages {
                        stage('vck190_es1_mipiRxQuad_hdmiTx platform build')  {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/platforms/vivado/vck190_es1_mipiRxQuad_hdmiTx/**"
                                    triggeredBy 'TimerTrigger'
                                }
                            }
                            steps {
                                sh label: 'platform build',
                                script: '''
                                    pushd src
                                    source ${setup} -r ${tool_release} && set -e
                                    ${lsf} make platform PFM=${pfm_base} JOBS=32
                                    popd
                                '''
                            }
                            post {
                                success {
                                    sh label: 'platform deploy',
                                    script: '''
                                        if [ "${BRANCH_NAME}" == "${deploy_branch}" ]; then
                                            pushd src
                                            mkdir -p ${DEPLOYDIR}
                                            cp -rf platforms/${pfm} ${DEPLOYDIR}
                                            popd
                                        fi
                                    '''
                                }
                            }
                        }
                    }
                }
                stage('vck190_mipiRxQuad_hdmiTx') {
                    environment {
                        pfm_base="vck190_mipiRxQuad_hdmiTx"
                        pfm="xilinx_${pfm_base}_${pfm_ver}"
                    }
                    stages {
                        stage('vck190_mipiRxQuad_hdmiTx platform build')  {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/platforms/vivado/vck190_mipiRxQuad_hdmiTx/**"
                                    triggeredBy 'TimerTrigger'
                                }
                            }
                            steps {
                                sh label: 'platform build',
                                script: '''
                                    pushd src
                                    source ${setup} -r ${tool_release} && set -e
                                    ${lsf} make platform PFM=${pfm_base} JOBS=32
                                    popd
                                '''
                            }
                            post {
                                success {
                                    sh label: 'platform deploy',
                                    script: '''
                                        if [ "${BRANCH_NAME}" == "${deploy_branch}" ]; then
                                            pushd src
                                            mkdir -p ${DEPLOYDIR}
                                            cp -rf platforms/${pfm} ${DEPLOYDIR}
                                            popd
                                        fi
                                    '''
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    post {
        cleanup {
            cleanWs()
        }
    }
}

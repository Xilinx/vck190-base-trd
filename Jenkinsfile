/*
 * (C) Copyright 2020 - 2021 Xilinx, Inc.
 * SPDX-License-Identifier: Apache-2.0
 */

def createWorkDir() {
    sh label: 'create work dir',
    script: '''
        if [ ! -d ${work_dir} ]; then
            mkdir -p ${work_dir}
            cp -rf ${ws}/src/* ${work_dir}
        fi
    '''
}

def buildPlatform() {
    sh label: 'platform build',
    script: '''
        source ${setup} -r ${tool_release} && set -e
        pushd ${work_dir}
        ${lsf} make platform PFM=${pfm_base} JOBS=31
        popd
    '''
}

def deployPlatform() {
    sh label: 'platform deploy',
    script: '''
        if [ "${BRANCH_NAME}" = "${deploy_branch}" ]; then
            pushd ${work_dir}
            DST=${DEPLOYDIR}/platforms
            mkdir -p ${DST}
            cp -rf platforms/${pfm} ${DST}
            popd
        fi
    '''
}

def checkOverlayDeps() {
    sh label: 'check dependencies',
    script: '''
        pushd ${work_dir}
        if [ -d platforms/${pfm} ]; then
            echo "Using platform from local build"
        elif [ -d ${DEPLOYDIR}/platforms/${pfm} ]; then
            echo "Using platform from build artifacts"
            ln -s ${DEPLOYDIR}/platforms/${pfm} platforms/
        else
            echo "No valid platform found: ${pfm}"
            exit 1
        fi
        popd
    '''
}

def buildOverlay() {
    sh label: 'overlay build',
    script: '''
        source ${setup} -r ${tool_release} && set -e
        pushd ${work_dir}
        ${lsf} make overlay PFM=${pfm_base} OVERLAY=${overlay}
        popd
    '''
}

def deployOverlay() {
    sh label: 'overlay deploy',
    script: '''
        if [ "${BRANCH_NAME}" = "${deploy_branch}" ]; then
            DST=${DEPLOYDIR}/overlays/${pfm_base}_${overlay}
            mkdir -p ${DST}
            cp -f ${overlay_dir}/binary_container_1.xsa \
                ${overlay_dir}/binary_container_1.xclbin \
                ${DST}
        fi
    '''
}

def checkPlnxDeps() {
    sh label: 'check dependencies',
    script: '''
        if [[ -f ${ws}/${overlay_dir}/binary_container_1.xsa && \
                -f ${ws}/${overlay_dir}/binary_container_1.xclbin ]]; then
            echo "Using local xsa and xclbin"
            cp ${ws}/${overlay_dir}/binary_container_1.xsa \
                ${ws}/${overlay_dir}/binary_container_1.xclbin \
                ${overlay_dir}
        elif [[ -f ${DEPLOYDIR}/overlays/${pfm_base}_${overlay}/binary_container_1.xsa && \
                -f ${DEPLOYDIR}/overlays/${pfm_base}_${overlay}/binary_container_1.xclbin ]]; then
            echo "Using xsa and xclbin from build artifacts"
            cp ${DEPLOYDIR}/overlays/${pfm_base}_${overlay}/binary_container_1.xsa \
                ${DEPLOYDIR}/overlays/${pfm_base}_${overlay}/binary_container_1.xclbin \
                ${overlay_dir}
        else
            echo "No valid xsa and xclbin found"
            exit 1
        fi

        if [ -d ${ws}/${pfm_dir} ]; then
            echo "Using platform from local build"
            ln -s ${ws}/${pfm_dir} ${pfm_dir}
        elif [ -d ${DEPLOYDIR}/platforms/${pfm} ]; then
            echo "Using platform from build artifacts"
            ln -s ${DEPLOYDIR}/platforms/${pfm} ${pfm_dir}
        else
            echo "No valid platform found: ${pfm}"
            exit 1
        fi
    '''
}

def buildPlnx() {
    sh label: 'build project',
    script: '''
        source ${setup} -p -r ${tool_release} -b ${tool_build} && set -e
        sed -i -e "s#CONFIG_TMP_DIR_LOCATION=.*#CONFIG_TMP_DIR_LOCATION=\\"${NEWTMPDIR}\\"#" \
            ${plnx_dir}/project-spec/configs/config
        rm -rf ${plnx_dir}/.git*
        pushd ${work_dir}
        make sdcard PFM=${pfm_base} OVERLAY=${overlay} YES=1
        popd
    '''
}

def deployPlnx() {
    sh label: 'copy artifacts',
    script:'''
        if [ "${BRANCH_NAME}" = "${deploy_branch}" ]; then
            DST="${DEPLOYDIR}/petalinux/${pfm_base}_${overlay}"
            mkdir -p ${DST}
            cp ${plnx_dir}/images/linux/petalinux-sdimage.wic.xz ${DST}
        fi
    '''
}

def deletePlnxTmpDir() {
    sh label: 'delete TMPDIR',
    script: 'rm -rf ${NEWTMPDIR}'
}

pipeline {
    agent {
        label 'Build_Master'
    }
    environment {
        deploy_branch="2021.2"
        tool_release="2021.2"
        tool_build="daily_latest"
        auto_branch="2021.2"
        pfm_ver="202120_1"
        ws="${WORKSPACE}"
        setup="${ws}/paeg-helper/env-setup.sh"
        lsf="${ws}/paeg-helper/scripts/lsf"
        DEPLOYDIR="/wrk/paeg_builds/build-artifacts/vck190-base-trd/${tool_release}"
    }
    options {
        // don't let the implicit checkout happen
        skipDefaultCheckout true
    }
    triggers {
        cron(env.BRANCH_NAME == '2021.2' ? 'H 21 * * *' : '')
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
                stage('vck190_es1_hdmiRx_hdmiTx - filter2d') {
                    environment {
                        pfm_base="vck190_es1_hdmiRx_hdmiTx"
                        pfm="xilinx_${pfm_base}_${pfm_ver}"
                        overlay="filter2d"
                        work_dir="work/${pfm_base}/${overlay}"
                        pfm_dir="${work_dir}/platforms/${pfm}"
                        overlay_dir="${work_dir}/overlays/${overlay}/kernels"
                        plnx_dir="${work_dir}/petalinux/xilinx-vck190-base-trd"
                    }
                    stages {
                        stage('vck190_es1_hdmiRx_hdmiTx platform build')  {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/platforms/vivado/vck190*hdmiRx_hdmiTx/**"
                                    triggeredBy 'TimerTrigger'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_ES1_HDMI_F2D = '1'
                                }
                                createWorkDir()
                                buildPlatform()
                            }
                            post {
                                success {
                                    deployPlatform()
                                }
                            }
                        }
                        stage('filter2d_combined overlay build') {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/overlays/${overlay}/kernels/**"
                                    triggeredBy 'TimerTrigger'
                                    environment name: 'BUILD_ES1_HDMI_F2D', value: '1'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_ES1_HDMI_PLNX = '1'
                                }
                                createWorkDir()
                                checkOverlayDeps()
                                buildOverlay()
                            }
                            post {
                                success {
                                    deployOverlay()
                                }
                            }
                        }
                        stage('petalinux build') {
                            agent {
                                node {
                                    label 'Slave'
                                }
                            }
                            environment {
                                NEWTMPDIR = sh(script: 'mktemp -d /tmp/${rel_name}.XXXXXXXXXX', returnStdout: true).trim()
                            }
                            options {
                                skipDefaultCheckout true
                            }
                            when {
                                anyOf {
                                    changeset "**/petalinux/xilinx-vck190-base-trd/**"
                                    triggeredBy 'TimerTrigger'
                                    environment name: 'BUILD_ES1_HDMI_PLNX', value: '1'
                                }
                            }
                            steps {
                                createWorkDir()
                                checkPlnxDeps()
                                buildPlnx()
                            }
                            post {
                                success {
                                    deployPlnx()
                                }
                                cleanup {
                                    deletePlnxTmpDir()
                                    cleanWs()
                                }
                            }
                        }
                    }
                }
                stage('vck190_hdmiRx_hdmiTx - filter2d') {
                    environment {
                        pfm_base="vck190_hdmiRx_hdmiTx"
                        pfm="xilinx_${pfm_base}_${pfm_ver}"
                        overlay="filter2d"
                        work_dir="work/${pfm_base}/${overlay}"
                        pfm_dir="${work_dir}/platforms/${pfm}"
                        overlay_dir="${work_dir}/overlays/${overlay}/kernels"
                        plnx_dir="${work_dir}/petalinux/xilinx-vck190-base-trd"
                    }
                    stages {
                        stage('vck190_hdmiRx_hdmiTx platform build')  {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/platforms/vivado/${pfm_base}/**"
                                    triggeredBy 'TimerTrigger'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_HDMI_F2D = '1'
                                }
                                createWorkDir()
                                buildPlatform()
                            }
                            post {
                                success {
                                    deployPlatform()
                                }
                            }
                        }
                        stage('filter2d_combined overlay build') {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/overlays/${overlay}/kernels/**"
                                    triggeredBy 'TimerTrigger'
                                    environment name: 'BUILD_HDMI_F2D', value: '1'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_HDMI_PLNX = '1'
                                }
                                createWorkDir()
                                checkOverlayDeps()
                                buildOverlay()
                            }
                            post {
                                success {
                                    deployOverlay()
                                }
                            }
                        }
                        stage('petalinux build') {
                            agent {
                                node {
                                    label 'Slave'
                                }
                            }
                            environment {
                                NEWTMPDIR = sh(script: 'mktemp -d /tmp/${rel_name}.XXXXXXXXXX', returnStdout: true).trim()
                            }
                            options {
                                skipDefaultCheckout true
                            }
                            when {
                                anyOf {
                                    changeset "**/petalinux/xilinx-vck190-base-trd/**"
                                    triggeredBy 'TimerTrigger'
                                    environment name: 'BUILD_HDMI_PLNX', value: '1'
                                }
                            }
                            steps {
                                createWorkDir()
                                checkPlnxDeps()
                                buildPlnx()
                            }
                            post {
                                success {
                                    deployPlnx()
                                }
                                cleanup {
                                    deletePlnxTmpDir()
                                    cleanWs()
                                }
                            }
                        }
                    }
                }
                stage('vck190_es1_mipiRxSingle_hdmiTx - filter2d') {
                    environment {
                        pfm_base="vck190_es1_mipiRxSingle_hdmiTx"
                        pfm="xilinx_${pfm_base}_${pfm_ver}"
                        overlay="filter2d"
                        work_dir="work/${pfm_base}/${overlay}"
                        pfm_dir="${work_dir}/platforms/${pfm}"
                        overlay_dir="${work_dir}/overlays/${overlay}/kernels"
                        plnx_dir="${work_dir}/petalinux/xilinx-vck190-base-trd"
                    }
                    stages {
                        stage('vck190_es1_mipiRxSingle_hdmiTx platform build')  {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/platforms/vivado/vck190*mipiRxSingle_hdmiTx/**"
                                    triggeredBy 'TimerTrigger'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_ES1_SINGLE_F2D = '1'
                                }
                                createWorkDir()
                                buildPlatform()
                            }
                            post {
                                success {
                                    deployPlatform()
                                }
                            }
                        }
                        stage('filter2d_combined overlay build') {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/overlays/${overlay}/kernels/**"
                                    triggeredBy 'TimerTrigger'
                                    environment name: 'BUILD_ES1_SINGLE_F2D', value: '1'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_ES1_SINGLE_PLNX = '1'
                                }
                                createWorkDir()
                                checkOverlayDeps()
                                buildOverlay()
                            }
                            post {
                                success {
                                    deployOverlay()
                                }
                            }
                        }
                        stage('petalinux build') {
                            agent {
                                node {
                                    label 'Slave'
                                }
                            }
                            environment {
                                NEWTMPDIR = sh(script: 'mktemp -d /tmp/${rel_name}.XXXXXXXXXX', returnStdout: true).trim()
                            }
                            options {
                                skipDefaultCheckout true
                            }
                            when {
                                anyOf {
                                    changeset "**/petalinux/xilinx-vck190-base-trd/**"
                                    triggeredBy 'TimerTrigger'
                                    environment name: 'BUILD_ES1_SINGLE_PLNX', value: '1'
                                }
                            }
                            steps {
                                createWorkDir()
                                checkPlnxDeps()
                                buildPlnx()
                            }
                            post {
                                success {
                                    deployPlnx()
                                }
                                cleanup {
                                    deletePlnxTmpDir()
                                    cleanWs()
                                }
                            }
                        }
                    }
                }
                stage('vck190_mipiRxSingle_hdmiTx -xvdpu') {
                    environment {
                        pfm_base="vck190_mipiRxSingle_hdmiTx"
                        pfm="xilinx_${pfm_base}_${pfm_ver}"
                        overlay="xvdpu"
                        work_dir="work/${pfm_base}/${overlay}"
                        pfm_dir="${work_dir}/platforms/${pfm}"
                        overlay_dir="${work_dir}/overlays/${overlay}/kernels"
                        plnx_dir="${work_dir}/petalinux/xilinx-vck190-base-trd"
                    }
                    stages {
                        stage('vck190_mipiRxSingle_hdmiTx platform build')  {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/platforms/vivado/${pfm_base}/**"
                                    triggeredBy 'TimerTrigger'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_SINGLE_DPU = '1'
                                }
                                createWorkDir()
                                buildPlatform()
                            }
                            post {
                                success {
                                    deployPlatform()
                                }
                            }
                        }
                        stage('xvdpu overlay build') {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/overlays/${overlay}/kernels/**"
                                    triggeredBy 'TimerTrigger'
                                    environment name: 'BUILD_SINGLE_DPU', value: '1'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_SINGLE_DPU_PLNX = '1'
                                }
                                createWorkDir()
                                checkOverlayDeps()
                                buildOverlay()
                            }
                            post {
                                success {
                                    deployOverlay()
                                }
                            }
                        }
                        stage('petalinux build') {
                            agent {
                                node {
                                    label 'Slave'
                                }
                            }
                            environment {
                                NEWTMPDIR = sh(script: 'mktemp -d /tmp/${rel_name}.XXXXXXXXXX', returnStdout: true).trim()
                            }
                            options {
                                skipDefaultCheckout true
                            }
                            when {
                                anyOf {
                                    changeset "**/petalinux/xilinx-vck190-base-trd/**"
                                    triggeredBy 'TimerTrigger'
                                    environment name: 'BUILD_SINGLE_DPU_PLNX', value: '1'
                                }
                            }
                            steps {
                                createWorkDir()
                                checkPlnxDeps()
                                buildPlnx()
                            }
                            post {
                                success {
                                    deployPlnx()
                                }
                                cleanup {
                                    deletePlnxTmpDir()
                                    cleanWs()
                                }
                            }
                        }
                    }
                }
                stage('vck190_es1_mipiRxQuad_hdmiTx - filter2d') {
                    environment {
                        pfm_base="vck190_es1_mipiRxQuad_hdmiTx"
                        pfm="xilinx_${pfm_base}_${pfm_ver}"
                        overlay="filter2d"
                        work_dir="work/${pfm_base}/${overlay}"
                        pfm_dir="${work_dir}/platforms/${pfm}"
                        overlay_dir="${work_dir}/overlays/${overlay}/kernels"
                        plnx_dir="${work_dir}/petalinux/xilinx-vck190-base-trd"
                    }
                    stages {
                        stage('vck190_es1_mipiRxQuad_hdmiTx platform build')  {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/platforms/vivado/vck190*mipiRxQuad_hdmiTx/**"
                                    triggeredBy 'TimerTrigger'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_ES1_QUAD_F2D = '1'
                                }
                                createWorkDir()
                                buildPlatform()
                            }
                            post {
                                success {
                                    deployPlatform()
                                }
                            }
                        }
                        stage('filter2d_combined overlay build') {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/overlays/${overlay}/kernels/**"
                                    triggeredBy 'TimerTrigger'
                                    environment name: 'BUILD_ES1_QUAD_F2D', value: '1'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_ES1_QUAD_PLNX = '1'
                                }
                                createWorkDir()
                                checkOverlayDeps()
                                buildOverlay()
                            }
                            post {
                                success {
                                    deployOverlay()
                                }
                            }
                        }
                        stage('petalinux build') {
                            agent {
                                node {
                                    label 'Slave'
                                }
                            }
                            environment {
                                NEWTMPDIR = sh(script: 'mktemp -d /tmp/${rel_name}.XXXXXXXXXX', returnStdout: true).trim()
                            }
                            options {
                                skipDefaultCheckout true
                            }
                            when {
                                anyOf {
                                    changeset "**/petalinux/xilinx-vck190-base-trd/**"
                                    triggeredBy 'TimerTrigger'
                                    environment name: 'BUILD_ES1_QUAD_PLNX', value: '1'
                                }
                            }
                            steps {
                                createWorkDir()
                                checkPlnxDeps()
                                buildPlnx()
                            }
                            post {
                                success {
                                    deployPlnx()
                                }
                                cleanup {
                                    deletePlnxTmpDir()
                                    cleanWs()
                                }
                            }
                        }
                    }
                }
                stage('vck190_mipiRxQuad_hdmiTx -xvdpu') {
                    environment {
                        pfm_base="vck190_mipiRxQuad_hdmiTx"
                        pfm="xilinx_${pfm_base}_${pfm_ver}"
                        overlay="xvdpu"
                        work_dir="work/${pfm_base}/${overlay}"
                        pfm_dir="${work_dir}/platforms/${pfm}"
                        overlay_dir="${work_dir}/overlays/${overlay}/kernels"
                        plnx_dir="${work_dir}/petalinux/xilinx-vck190-base-trd"
                    }
                    stages {
                        stage('vck190_mipiRxQuad_hdmiTx platform build')  {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/platforms/vivado/${pfm_base}/**"
                                    triggeredBy 'TimerTrigger'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_QUAD_DPU = '1'
                                }
                                createWorkDir()
                                buildPlatform()
                            }
                            post {
                                success {
                                    deployPlatform()
                                }
                            }
                        }
                        stage('xvdpu overlay build') {
                            environment {
                                PAEG_LSF_MEM=65536
                                PAEG_LSF_QUEUE="long"
                            }
                            when {
                                anyOf {
                                    changeset "**/overlays/${overlay}/kernels/**"
                                    triggeredBy 'TimerTrigger'
                                    environment name: 'BUILD_QUAD_DPU', value: '1'
                                }
                            }
                            steps {
                                script {
                                    env.BUILD_QUAD_DPU_PLNX = '1'
                                }
                                createWorkDir()
                                checkOverlayDeps()
                                buildOverlay()
                            }
                            post {
                                success {
                                    deployOverlay()
                                }
                            }
                        }
                        stage('petalinux build') {
                            agent {
                                node {
                                    label 'Slave'
                                }
                            }
                            environment {
                                NEWTMPDIR = sh(script: 'mktemp -d /tmp/${rel_name}.XXXXXXXXXX', returnStdout: true).trim()
                            }
                            options {
                                skipDefaultCheckout true
                            }
                            when {
                                anyOf {
                                    changeset "**/petalinux/xilinx-vck190-base-trd/**"
                                    triggeredBy 'TimerTrigger'
                                    environment name: 'BUILD_QUAD_DPU_PLNX', value: '1'
                                }
                            }
                            steps {
                                createWorkDir()
                                checkPlnxDeps()
                                buildPlnx()
                            }
                            post {
                                success {
                                    deployPlnx()
                                }
                                cleanup {
                                    deletePlnxTmpDir()
                                    cleanWs()
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

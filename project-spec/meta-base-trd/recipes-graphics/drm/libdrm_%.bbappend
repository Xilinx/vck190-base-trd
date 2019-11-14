inherit update-alternatives

ALTERNATIVE_PRIORITY = "10"
ALTERNATIVE_${PN} = "kmstest"
ALTERNATIVE_LINK_NAME[kmstest] = "${bindir}/kmstest"

require qcom-robotics-minimal-image.bb

SUMMARY = "Basic robotics console image"

LICENSE = "BSD-3-Clause-Clear"

IMAGE_FEATURES += "package-management ssh-server-openssh"

CORE_IMAGE_BASE_INSTALL += " \
    packagegroup-qcom-robotics-base \
"

CORE_IMAGE_EXTRA_INSTALL += " \
    libgomp \
    libgomp-dev \
    libgomp-staticdev \
    packagegroup-qcom-securemsm \
"

# docker pulls runc/containerd, which in turn recommend lxc unecessarily

BAD_RECOMMENDATIONS:append = " lxc"

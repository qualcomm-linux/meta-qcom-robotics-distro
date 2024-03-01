require recipes-products/images/qcom-multimedia-image.bb

SUMMARY = "multimedia image with ros and qirf sdk"

LICENSE = "BSD-3-Clause-Clear"

CORE_IMAGE_BASE_INSTALL += " \
    packagegroup-qcom-robotics \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ros2-humble', 'packagegroup-qti-ros2-humble', '', d)} \
"

CORE_IMAGE_EXTRA_INSTALL += " \
    libgpiod \
    libgpiod-dev \
"

TOOLCHAIN_TARGET_TASK:remove = "packagegroup-qcom-robotics"

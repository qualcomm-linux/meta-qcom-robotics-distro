include recipes-products/images/qcom-multimedia-image.bb

SUMMARY = "multimedia image with ros and qirp sdk"

LICENSE = "BSD-3-Clause-Clear"

CORE_IMAGE_BASE_INSTALL += " \
    ros-core \
    demo-nodes-cpp \
"

CORE_IMAGE_BASE_INSTALL:append:qcm6490:qcom-custom-bsp = " \
    qirp-sdk \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ros2-humble', 'packagegroup-qti-ros2-humble', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ros2-humble', 'packagegroup-qcom-robotics', '', d)} \
"

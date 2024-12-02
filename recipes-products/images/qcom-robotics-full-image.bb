include recipes-products/images/qcom-multimedia-image.bb

SUMMARY = "multimedia image with ros and qirp sdk"

LICENSE = "BSD-3-Clause-Clear"

CORE_IMAGE_BASE_INSTALL += " \
    ros-core \
    demo-nodes-cpp \
    qirp-sdk \
"

CORE_IMAGE_BASE_INSTALL:append:qcom-robotics-ros2-jazzy = " \
    packagegroup-qcom-ros2 \
"

CORE_IMAGE_BASE_INSTALL:append:qcm6490:qcom-custom-bsp = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ros2-humble', 'packagegroup-qti-ros2-humble', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ros2-humble', 'packagegroup-qcom-robotics', '', d)} \
"

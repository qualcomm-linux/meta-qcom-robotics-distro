include recipes-products/images/qcom-multimedia-image.bb

SUMMARY = "multimedia image with ROS core"

LICENSE = "BSD-3-Clause-Clear"

CORE_IMAGE_BASE_INSTALL += " \
    ros-core \
    demo-nodes-cpp \
"


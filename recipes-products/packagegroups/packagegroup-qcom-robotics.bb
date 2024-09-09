SUMMARY = "Robotics SDK and ESDK Adding"
DESCRIPTION = "Robotics Package group for SDK and ESDK"

LICENSE = "BSD-3-Clause-Clear"

PACKAGE_ARCH = "${TUNE_PKGARCH}"

inherit packagegroup

PROVIDES = "${PACKAGES}"

PACKAGES = ' \
    packagegroup-qcom-robotics \
    '

RDEPENDS:packagegroup-qcom-robotics = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ros2-humble', ' \
    ament-cmake \
    ament-cmake-auto \
    ament-cmake-core \
    ament-cmake-export-definitions \
    ament-cmake-export-dependencies \
    ament-cmake-export-include-directories \
    ament-cmake-export-interfaces \
    ament-cmake-export-libraries \
    ament-cmake-export-link-flags \
    ament-cmake-export-targets \
    ament-cmake-gen-version-h \
    ament-cmake-gmock \
    ament-cmake-google-benchmark \
    ament-cmake-gtest \
    ament-cmake-include-directories \
    ament-cmake-libraries \
    ament-cmake-nose \
    ament-cmake-pytest \
    ament-cmake-python \
    ament-cmake-ros \
    ament-cmake-target-dependencies \
    ament-cmake-test \
    ament-cmake-version \
    ament-lint-auto \
    foonathan-memory-staticdev \
    opencv-staticdev \
    dmabuf-transport \
    image-transport \
    yaml-cpp \
    camera-info-manager \
    rclcpp \
    sensor-msgs \
    nav-msgs \
    std-msgs \
    geometry-msgs \
    tf2 \
    tf2-ros \
    tf2-geometry-msgs \
    cv-bridge \
    rosidl-adapter \
    ncnn-dev \
    rclcpp-components \
    rcutils \
    libgpiod \
    libgpiod-dev \
    ', '', d)} \
"
RDEPENDS:packagegroup-qcom-robotics:append:qcm6490:qcom-custom-bsp = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ros2-humble', ' \
    sensor-client \
    battery-client \
    syslog-plumber \
    qcom-camera-server \
    ${GL_PROVIDER} \
    qcom-fastcv-binaries \
    ', '', d)} \
"

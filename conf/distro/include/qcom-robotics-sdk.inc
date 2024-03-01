# To include host packages in SDK
#TOOLCHAIN_HOST_TASK:append = " nativesdk-protobuf-compiler "

# To include target packages in SDK
#TOOLCHAIN_TARGET_TASK:append = " resize-partitions"

#TOOLCHAIN_TARGET_TASK:append = " opencv"


# To provide tools for ROS node compile in SDK
TOOLCHAIN_HOST_TASK:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ros2-humble', ' \
    nativesdk-ament-package \
    nativesdk-python3-colcon-common-extensions \
    nativesdk-python3-numpy \
    nativesdk-rosidl-adapter \
    nativesdk-rosidl-cli \
    nativesdk-rosidl-cmake \
    nativesdk-rosidl-generator-c \
    nativesdk-rosidl-generator-cpp \
    nativesdk-rosidl-parser \
    nativesdk-rosidl-typesupport-c \
    nativesdk-rosidl-typesupport-cpp \
    nativesdk-rosidl-typesupport-fastrtps-c \
    nativesdk-rosidl-typesupport-fastrtps-cpp \
    nativesdk-rosidl-typesupport-introspection-c \
    nativesdk-rosidl-typesupport-introspection-cpp \
', '', d)}"

# To provide libs for ROS node compile in SDK
TOOLCHAIN_TARGET_TASK:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ros2-humble', ' \
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
', '', d)}"

# To provide libs for GPIO sample in sdk
TOOLCHAIN_TARGET_TASK:append = " \
    libgpiod \
    libgpiod-dev \
"

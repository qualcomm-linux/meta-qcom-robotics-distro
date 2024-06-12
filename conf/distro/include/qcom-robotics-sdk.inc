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

TOOLCHAIN_TARGET_TASK:remove = "qirp-sdk"
TOOLCHAIN_TARGET_TASK:remove = "qirf-sdk"

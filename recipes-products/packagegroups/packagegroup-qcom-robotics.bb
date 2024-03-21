SUMMARY = "Robotics programs and scripts"
DESCRIPTION = "Robotics Package group to bring in robotics feature"

LICENSE = "BSD-3-Clause-Clear"

PACKAGE_ARCH = "${TUNE_PKGARCH}"

inherit packagegroup

PROVIDES = "${PACKAGES}"

PACKAGES = ' \
    packagegroup-qcom-robotics \
    '

RDEPENDS:packagegroup-qcom-robotics = " \
    qirf-librealsense2 \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ros2-humble', ' \
    qirf-rplidar-ros2 \
    qirf-realsense2-camera \
    qirf-realsense2-camera-msgs \
    qirf-nav2-bringup \
    sensor-service \
    sensor-client \
    qirf-qrb-ros-imu \
    battery-service \
    battery-client \
    qirf-qrb-ros-battery \
    qirf-auto-explore \
    qirf-follow-me \
    qirf-mono-vslam \
    qirf-depth-vslam \
    qirf-voxel-map \
    qirf-ocr-service \
    qirf-qrb-ros-camera \
    dmabuf-transport \
    ', '', d)} \
"

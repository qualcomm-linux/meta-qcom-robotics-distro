DESCRIPTION = "ROS 2 package group"
LICENSE = "BSD-3-Clause"

inherit packagegroup

PACKAGE_ARCH = "${SOC_ARCH}"

PACKAGES = "\
    ${PN} \
    ${PN}-samples \
    ${PN}-extend \
"

RDEPENDS:${PN} = "\
    ros-base \
    ${PN}-samples \
    ${PN}-extend \
"

RDEPENDS:${PN}-extend = "\
    graphviz \
    rosidl-default-generators \
    launch-ros \
    joint-state-publisher \
    ament-lint-auto \
    ament-lint-common \
    ament-cmake-auto \
    ament-cmake-ros \
    rcl-logging-noop \
    image-transport \
    domain-bridge \
"

RDEPENDS:${PN}-samples = "\
    demo-nodes-cpp \
    demo-nodes-py \
    example-interfaces \
    logging-demo \
    composition \
    examples-rclcpp-minimal-action-server \
    action-tutorials-cpp \
    action-tutorials-py \
    examples-rclcpp-minimal-publisher \
    examples-rclcpp-minimal-subscriber \
    examples-rclpy-minimal-subscriber \
    examples-rclpy-minimal-publisher \
    examples-rclpy-minimal-action-server \
    examples-rclpy-minimal-action-client \
"

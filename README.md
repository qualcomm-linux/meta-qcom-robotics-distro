OpenEmbedded/Yocto layer for Qcom Robotics Distribution Images
=============================================================
This layer provides support for Qcom Robotics Reference images for
use with OpenEmbedded and/or Yocto Qcom's BSP layer.

## Host Setup

Refer to https://github.com/quic-yocto/qcom-manifest/blob/qcom-linux-kirkstone/README.md setup the host environment.


## Download the Yocto Project BSP

To download the `qcom-6.6.00-QLI.1.0-Ver.1.0_robotics` release

```bash
repo init -u https://github.com/quic-yocto/qcom-manifest -b qcom-linux-kirkstone -m qcom-6.6.00-QLI.1.0-Ver.1.0_robotics.xml
repo sync
```

## Build an image

Export SHELL
```bash
export SHELL=/bin/bash
```

Initialize the build environment
```bash
MACHINE=qcm6490 DISTRO=qcom-robotics-ros2-humble source setup-robotics-environment
```

Build command:

```bash
bitbake qcom-robotics-full-image
```

NOTE: The robotics full image consists by:

1.Basic Qcom console image: https://github.com/quic-yocto/meta-qcom-distro/tree/kirkstone/recipes-products/images

2.Robotics specific feature

## Flash the image

Refer to User Guide on [qualcomm-linux-preview](https://www.qualcomm.com/products/internet-of-things/industrial/building-enterprise/qualcomm-linux-preview)
to complete Dev Kit setup and flash the artifacts.

## References

[Standard Yocto environment](https://docs.yoctoproject.org/4.0.13/brief-yoctoprojectqs/index.html)

QIRF(Qualcomm Intelligent Robotics Function) SDK,details can refer to (https://github.com/quic-yocto/meta-qcom-robotics)

QIRP(Qualcomm Intelligent Robotics Product) SDK, details can refer to (https://github.com/quic-yocto/meta-qcom-robotics-sdk)

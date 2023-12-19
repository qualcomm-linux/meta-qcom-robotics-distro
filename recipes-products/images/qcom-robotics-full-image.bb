require qcom-robotics-console-image.bb

SUMMARY = "robotics full image"

CORE_IMAGE_EXTRA_INSTALL += " \
    packagegroup-qcom-robotics \
"

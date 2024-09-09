# Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause-Clear

# set_bb_env.sh
# Call base setup-environment to set up build enviroment
# Add robotics layers to bblayers.conf

if [[ ! $(readlink -f $(which sh)) =~ bash ]]
then
    echo ""
    echo "### ERROR: Please Change your /bin/sh symlink to point to bash. ### "
    echo ""
    echo "### sudo ln -sf /bin/bash /bin/sh ### "
    echo ""
    return 1
fi

# The SHELL variable also needs to be set to /bin/bash otherwise the build
# will fail, use chsh to change it to bash.
if [[ ! $SHELL =~ bash ]]
then
    echo ""
    echo "### ERROR: Please Change your shell to bash using chsh. ### "
    echo ""
    echo "### Make sure that the SHELL variable points to /bin/bash ### "
    echo ""
    return 1
fi

umask 022

# This script
THIS_SCRIPT=$(readlink -f ${BASH_SOURCE[0]})
# Find where the global conf directory is...
scriptdir="$(dirname "${THIS_SCRIPT}")"
# Find where the workspace is...
SRC_TREE=$(readlink -f $scriptdir/../..)

patches_for_meta_ros () {
    PATCHES_DIR=${SRC_TREE}/layers/*/patches
    cd ${SRC_TREE}/layers/meta-ros
    find $PATCHES_DIR -name "*.patch" | while read -r patchfile; do
        if git apply --check "$patchfile"; then
            git apply "$patchfile"
        else
            echo "Skipped patch to meta-ros: $patchfile"
        fi
    done

    cd -
}

patches_for_meta_ros &> /dev/null

ROBOT_MACHINE=${MACHINE}
source ${SRC_TREE}/setup-environment

if [[ ${ROBOT_MACHINE} == *"6490"* ]];then
    if [ ! -d ${SRC_TREE}/downloads/meta-ros-custom ];then
        mkdir ${SRC_TREE}/downloads 2> /dev/null
        cd ${SRC_TREE}/downloads
        git clone https://git.codelinaro.org/clo/le/meta-ros.git -b ros.qclinux.1.0.r1-rel meta-ros-custom
        cd -
    fi

    # Add robotics layers
    if [ `grep -c "meta-ros2" ${BUILDDIR}/conf/bblayers.conf` -eq '0' ]; then
        cat >> ${BUILDDIR}/conf/bblayers.conf <<EOF

BBLAYERS += " \\
${SRC_TREE}/downloads/meta-ros-custom/meta-ros2 \\
${SRC_TREE}/downloads/meta-ros-custom/meta-ros2-humble \\
${SRC_TREE}/downloads/meta-ros-custom/meta-ros-common \\
${SRC_TREE}/layers/meta-qcom-qim-product-sdk \\
${SRC_TREE}/layers/meta-qcom-robotics-sdk \\
${SRC_TREE}/layers/meta-qcom-robotics-distro \\
${SRC_TREE}/layers/meta-qcom-robotics \\
"
EOF
   fi
else # [ ${MACHINE} != *"6490" ]
    # Add robotics layers
    if [ `grep -c "meta-ros2" ${BUILDDIR}/conf/bblayers.conf` -eq '0' ]; then
        cat >> ${BUILDDIR}/conf/bblayers.conf <<EOF

BBLAYERS += " \\
${SRC_TREE}/layers/meta-ros/meta-ros2 \\
${SRC_TREE}/layers/meta-ros/meta-ros2-humble \\
${SRC_TREE}/layers/meta-ros/meta-ros-common \\
${SRC_TREE}/layers/meta-qcom-qim-product-sdk \\
${SRC_TREE}/layers/meta-qcom-robotics-sdk \\
${SRC_TREE}/layers/meta-qcom-robotics-distro \\
${SRC_TREE}/layers/meta-qcom-robotics \\
"

EOF
   fi
fi

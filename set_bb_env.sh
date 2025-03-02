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

ROBOT_MACHINE=${MACHINE}

source ${SRC_TREE}/setup-environment

# Apply patches
if [ -f "$SRC_TREE/patch_applied.done" ];then
    echo "Patches have been applied."
else
    result=$(python3 $SRC_TREE/layers/meta-qcom-robotics/scripts/apply_patches.py $SRC_TREE/layers/meta-qcom-robotics/patches/patches.yaml $SRC_TREE 2>&1)
    if [ $? == '0' ];then
        touch $SRC_TREE/patch_applied.done
    else
        echo "$result"
        echo -e "\033[0;31m ***************************************************** \033[0m"
        echo -e "\033[0;31m Patches are not applied successfully, please check!!! \033[0m"
        echo -e "\033[0;31m ***************************************************** \033[0m"
    fi
fi



# Add robotics layers
if [ `grep -c "meta-ros2" ${BUILDDIR}/conf/bblayers.conf` -eq '0' ]; then
    cat >> ${BUILDDIR}/conf/bblayers.conf <<EOF

BBLAYERS += " \\
${SRC_TREE}/layers/meta-ros/meta-ros2 \\
${SRC_TREE}/layers/meta-ros/meta-ros2-jazzy \\
${SRC_TREE}/layers/meta-ros/meta-ros-common \\
${SRC_TREE}/layers/meta-qcom-qim-product-sdk \\
${SRC_TREE}/layers/meta-qcom-robotics-sdk \\
${SRC_TREE}/layers/meta-qcom-robotics-distro \\
${SRC_TREE}/layers/meta-qcom-robotics \\
"
EOF
fi

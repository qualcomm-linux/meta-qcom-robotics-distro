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
WS=$(readlink -f $scriptdir/../..)
#echo "ws:${WS}"
source ${WS}/setup-environment

cat >> ${BUILDDIR}/conf/bblayers.conf <<EOF

BBLAYERS += " \\
  \${WORKSPACE}/layers/meta-qcom-robotics-sdk \\
  \${WORKSPACE}/layers/meta-qcom-robotics-distro \\
  \${WORKSPACE}/layers/meta-qcom-robotics \\
  \${WORKSPACE}/layers/meta-ros/meta-ros2 \\
  \${WORKSPACE}/layers/meta-ros/meta-ros2-humble \\
  \${WORKSPACE}/layers/meta-ros/meta-ros-common \\
"

EOF

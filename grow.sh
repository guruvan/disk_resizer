#!/bin/bash
RESIZE_DEV="$1"
test -b /dev/${RESIZE_DEV} || export RESIZE_DEV=""
if [ "X${RESIZE_DEV}" = "X" ] ; then
   echo "Must set RESIZE_DEV=[/dev/a_valid_block_device]"
   exit 1
elif [ "${RESIZE_DEV}" = "xvda1" ] ; then
   resize2fs /dev/${RESIZE_DEV}
else
  growpart /dev/${RESIZE_DEV} 1
  probepart
  resize2fs /dev/${RESIZE_DEV}
fi

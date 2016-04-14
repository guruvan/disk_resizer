#!/bin/sh
RESIZE_DEV="$1"
test -b /dev/${RESIZE_DEV} || export RESIZE_DEV=""
if [ "X${RESIZE_DEV}" = "X" ] ; then
   echo "Must set RESIZE_DEV=[a_valid_block_device]"
   echo "docker run -it --rm slamper/resizefs xvda"
   echo "or"
   echo "docker run -it --rm --privileged slamper/resizefs xvda1"
   echo "or any other available valid block device"
   exit 1
elif [ "${RESIZE_DEV}" = "xvda1" ] ; then
   resize2fs /dev/${RESIZE_DEV}
else
  /growpart /dev/${RESIZE_DEV} 1
  partprobe 
  resize2fs /dev/${RESIZE_DEV}1
fi

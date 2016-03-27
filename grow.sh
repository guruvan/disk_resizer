#!/bin/sh
RESIZE_DEV=${RESIZE_DEV:?"RESIZE_DEV not set."}

if [ -b "${RESIZE_DEV}" ]; then
  ./growpart ${RESIZE_DEV} 1
  partprobe
  resize2fs ${RESIZE_DEV}1
else
  echo "Block device expected: ${RESIZE_DEV} is not."
  exit 1
fi

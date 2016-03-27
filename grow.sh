#!/bin/sh
./growpart /dev/vda 1
partprobe
resize2fs /dev/vda1

# disk_resizer

automagic online resize for your partitions 

Example Usage:

For most systems, use the base device name (without /dev/):

  ```docker run -it --rm --privileged guruvan/resizefs:v0.0.4 xvda```
  
or 
On Some systems (i.e. AWS PV hosts (t1.micro etc) you may not have /dev/xvda or /dev/sda and may only have /dev/xvda1

```docker run -it --rm --privileged guruvan/resizefs:v0.0.4 xvda1```

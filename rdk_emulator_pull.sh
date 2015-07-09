#!/bin/bash -x

mkdir tip_21
cd tip_21
#
# pull the rdk code in this case version 2.1
#
repo init -u https://code.rdkcentral.com/r/manifests -b 2.1 -m emulator.xml
repo sync -c -j 16

#
# now pull the meta-cisco-oss from github
#
git clone https://github.com/cisco/meta-cisco-oss.git

#
# we now have to tell the RDK yocto environment about our layer
# a one line change 
#
patch -p0  -i ../cisco_meta_layer_addition.patch

echo " You now can build and the run the hybrid image "


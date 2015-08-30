#!/bin/bash
##############################

# Needed by OSMC, because it doesnt came with development packages installed
#sudo apt-get update
sudo apt-get install build-essential rbp-userland-dev-osmc

# Install mjpg-streamer dependencies
sudo apt-get install git cmake imagemagick subversion libv4l-dev v4l-utils
#sudo apt-get install libjpeg8-dev libjpeg62-dev
sudo apt-get install libjpeg62-turbo-dev

# Clone the project
git clone https://github.com/jacksonliam/mjpg-streamer.git ~/mjpg-streamer
cd ~/mjpg-streamer/mjpg-streamer-experimental/
# build it
make clean all

# install it
sudo make install
###########################################
#
## It should be installed in this locations
#
# install --mode=755 mjpg_streamer /usr/local/bin
# install --mode=644 input_uvc.so output_file.so output_http.so output_rtsp.so input_raspicam.so /usr/local/lib/
# install --mode=755 -d /usr/local/www
# install --mode=644 -D www/* /usr/local/www
#
###########################################

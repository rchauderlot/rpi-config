#!/bin/bash
BASEDIR=$(dirname $0)
sudo cp $BASEDIR/init/mjpg-streamer /etc/init.d/mjpg-streamer
sudo chmod a+x /etc/init.d/mjpg-streamer
sudo update-rc.d mjpg-streamer defaults
sudo service mjpg-streamer start

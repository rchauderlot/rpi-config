#!/bin/sh
sudo service mjpg-streamer stop
sudo update-rc.d -f mjpg-streamer remove
sudo rm /etc/init.d/mjpg-streamer



#!/bin/sh
#
# created by : meinside@gmail.com
# updated by : rchauderlot@gmail.com
#
# last update: 2015.08.30.
#

################
# customize these:

# mjpg_streamer's install location
MJPG_STREAMER_INSTALL="/usr/local"

# mjpg_streamer excutable's location
MJPG_STREAMER_BINARY="$MJPG_STREAMER_INSTALL/bin/mjpg_streamer"

# mjpg_streamer libraries location
MJPG_STREAMER_LIBS="$MJPG_STREAMER_INSTALL/lib"

# streaming port
MJPG_STREAMER_PORT="8080"

# htmls and related files' location
MJPG_STREAMER_WWW="$MJPG_STREAMER_INSTALL/www"

# video device
DEVICE_IN="/dev/video0"

# video settings
#RESOLUTION="640x480"
#FPS="-f 30"
RESOLUTION="320x240"
FPS="-f 30"

# YUYV format
YUYV="-y"

# disable controls
CONTROLS="-n"

# authentication
#USERNAME="pi"
#PASSWORD="raspberry"
if [ ! -z $USERNAME ] && [ ! -z $PASSWORD ]; then
	AUTH="-c $USERNAME:$PASSWORD"
else
	AUTH=""
fi

# LED blink
LED="off"	# on/off/blink/auto (may not work on rpi camera modules)

# plugin
PLUGIN_IN="$MJPG_STREAMER_LIBS/input_uvc.so -d $DEVICE_IN -r $RESOLUTION $FPS $YUYV -l $LED $CONTROLS"
PLUGIN_OUT="$MJPG_STREAMER_LIBS/output_http.so -p $MJPG_STREAMER_PORT -w $MJPG_STREAMER_WWW $CONTROLS $AUTH"



################
# run mjpg_streamer
echo $MJPG_STREAMER_BINARY -i "$PLUGIN_IN" -o "$PLUGIN_OUT"
$MJPG_STREAMER_BINARY -i "$PLUGIN_IN" -o "$PLUGIN_OUT"
################


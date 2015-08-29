sudo apt-get install make cmake imagemagic subversion libv4l-dev v4l-utils libjpeg8-dev libjpeg62-dev libjpeg62-turbo-dev 
git clone https://github.com/jacksonliam/mjpg-streamer.git ~/mjpg-streamer
cd ~/mjpg-streamer/mjpg-streamer-experimental/
make clean all
#sudo mkdir -p /opt/mjpg-streamer
#sudo rm -rf /opt/mjpg-streamer/*
#make install
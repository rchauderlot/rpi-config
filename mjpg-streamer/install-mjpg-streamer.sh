sudo apt-get install libjpeg8-dev
sudo apt-get install imagemagic
sudo apt-get install subversion
sudo apt-get install libjpeg62-dev
sudo apt-get install cmake
git clone https://github.com/jacksonliam/mjpg-streamer.git ~/mjpg-streamer
cd mjpg-streamer/mjpg-streamer-experimental/
make clean all
sudo mkdir -p /opt/mjpg-streamer
sudo rm -rf /opt/mjpg-streamer

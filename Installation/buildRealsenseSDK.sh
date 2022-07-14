RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'
#for (( i = 30; i < 38; i++ )); do echo -e "\033[0;"$i"m Normal: (0;$i); \033[1;"$i"m Light: (1;$i)"; done
echo -e "${BLUE}Build Realsense SDK from the scourse for Jetson Nano by${GREEN} Guan"
read -r -p"Any key to continue";echo
cd ~
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade -y
sudo apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo bionic main" -u
sudo apt-get update
sudo apt-get install librealsense2-utils librealsense2-dev -y
git clone https://github.com/IntelRealSense/librealsense.git
echo "${GREEN}Begin to install dependencies of Realsense SDK.."
#read -r -p"Any key to continue";echo
sudo apt-get install git libssl-dev libusb-1.0-0-dev libudev-dev pkg-config libgtk-3-dev libglfw3-dev libglfw3 libgl1-mesa-dev libglu1-mesa-dev libsdl2-dev libxinerama-dev libudev-dev -y
echo "${BLUE}Begin to build Realsense SDK from scourse..."
#read -r -p"Any key to continue";echo
cd ~/librealsense
./scripts/setup_udev_rules.sh
#read -r -p"Any key to continue";echo
mkdir build && cd build
cmake ../ -DCMAKE_BUILD_TYPE=release -DBUILD_EXAMPLES=true -DBUILD_GRAPHICAL_EXAMPLES=true -DBUILD_NETWORK_DEVICE=ON
make -j4
sudo make install
cd ~
sudo chmod +x ~/MetaStream/Installation/runServer.sh
sudo chmod +x ~/MetaStream/Installation/runFan.sh
cp ~/MetaStream/Installation/runServer.sh ~/
cp ~/MetaStream/Installation/runFan.sh ~/

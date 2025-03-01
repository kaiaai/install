#!/bin/bash
# Install Kaia.ai ROS2 platform
#   https://github.com/kaiaai/install
. /opt/ros/iron/setup.bash
mkdir ~/uros_ws && cd ~/uros_ws
git clone --depth 1 -b iron https://github.com/micro-ROS/micro_ros_setup.git src/micro_ros_setup
sudo apt update
sudo apt install -y ed python3-pip
sudo apt install -y ros-iron-rmw-fastrtps-cpp
sudo apt remove -y ros-iron-rmw-cyclonedds-cpp
sudo rosdep init
rosdep update --rosdistro iron
rosdep install --from-paths src --ignore-src -y
colcon build
. install/local_setup.sh
ros2 run micro_ros_setup create_agent_ws.sh
ros2 run micro_ros_setup build_agent.sh
rm -rf log/ build/ src/

cd ~/.ros
wget https://raw.githubusercontent.com/kaiaai/install/main/ubuntu/etc/disable_fastdds_shm.xml
wget https://raw.githubusercontent.com/kaiaai/install/main/ubuntu/etc/disable_fastdds_shm_localhost_only.xml
cd ~

export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export MICROROS_DISABLE_SHM=1

mkdir ~/ros_ws && cd ~/ros_ws
sudo apt install -y python3-pip nano inotify-tools \
ros-iron-gazebo-ros-pkgs ros-iron-joint-state-publisher-gui \
ros-iron-cartographer-ros \
ros-iron-nav2-map-server ros-iron-nav2-bringup \
ros-iron-joint-state-publisher ros-iron-xacro
pip3 install aiortc aiohttp opencv-python
sudo apt autoremove -y
# sudo rm -rf /var/lib/apt/lists/*

git clone -b iron --depth 1 https://github.com/kaiaai/kaiaai_msgs src/kaiaai_msgs
git clone -b iron --depth 1 https://github.com/kaiaai/kaiaai src/kaiaai
git clone -b $ROS_DISTRO --depth 1 https://github.com/kaiaai/kaiaai_telemetry src/kaiaai_telemetry
git clone -b $ROS_DISTRO --depth 1 https://github.com/kaiaai/kaiaai_teleop src/kaiaai_teleop
git clone -b $ROS_DISTRO --depth 1 https://github.com/kaiaai/kaiaai_bringup src/kaiaai_bringup
git clone -b iron --depth 1 https://github.com/makerspet/makerspet_fido src/makerspet_fido
git clone -b iron --depth 1 https://github.com/makerspet/makerspet_loki src/makerspet_loki
git clone -b iron --depth 1 https://github.com/makerspet/makerspet_snoopy src/makerspet_snoopy
git clone -b iron --depth 1 https://github.com/makerspet/makerspet_mini src/makerspet_mini
git clone -b iron --depth 1 https://github.com/makerspet/makerspet src/makerspet
git clone -b iron --depth 1 https://github.com/kaiaai/kaiaai_gazebo src/kaiaai_gazebo
git clone --depth 1 https://github.com/kaiaai/kaiaai_web src/kaiaai_web
git clone --depth 1 https://github.com/kaiaai/kaiaai_apps src/kaiaai_apps
git clone --depth 1 https://github.com/kaiaai/m-explore-ros2 src/m-explore-ros2
git clone --depth 1 https://github.com/kaiaai/auto_mapper src/auto_mapper
git clone --depth 1 https://github.com/kaiaai/nav2_wfe src/nav2_wfe
colcon build --symlink-install
rm -rf log/
mkdir ~/maps

cat <<EOF >> ~/.bashrc
. ~/uros_ws/install/setup.bash
. ~/ros_ws/install/setup.bash
alias kaia='ros2 run kaiaai cli'

export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export MICROROS_DISABLE_SHM=1

if [ "$MICROROS_DISABLE_SHM" = "1" ] ; then
    if [ "$ROS_LOCALHOST_ONLY" = "1" ] ; then
        export FASTRTPS_DEFAULT_PROFILES_FILE=~/.ros/disable_fastdds_shm_localhost_only.xml
    else
        export FASTRTPS_DEFAULT_PROFILES_FILE=~/.ros/disable_fastdds_shm.xml
    fi
fi
echo "\033[31mVisit https://github.com/kaiaai/kaiaai for help\033[0m"
EOF

cat <<EOF >> ~/.bash_history
exit
ros2 launch kaiaai_bringup navigation.launch.py use_sim_time:=true slam:=True
ros2 launch kaiaai_gazebo world.launch.py
ros2 param set /pet lidar.scan.freq.target 7.0
ros2 launch kaiaai_bringup navigation.launch.py map:=$HOME/maps/map.yaml
ros2 run nav2_map_server map_saver_cli -f ~/maps/map --ros-args -p save_map_timeout:=60.0
ros2 launch explore_lite explore.launch.py
ros2 launch kaiaai_bringup navigation.launch.py slam:=True
ros2 launch kaiaai_bringup monitor_robot.launch.py
ros2 run kaiaai_teleop teleop_keyboard
ros2 launch kaiaai_bringup physical.launch.py
EOF

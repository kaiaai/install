#!/bin/bash
# Install Kaia.ai ROS2 platform on Ubuntu 24.04 without Docker
#   https://github.com/kaiaai/install
#
# Requires ROS2 Jazzy, e.g. installed by install_ros2_jazzy_ubuntu_24_04.sh
# Builds the same packages as the kaiaai/kaiaai:jazzy Docker image
# (docker/kaiaai/Dockerfile) into two workspaces:
#   ~/uros_ws  micro-ROS agent (talks to the robot's ESP32)
#   ~/ros_ws   Kaia.ai and Maker's Pet packages
# Safe to re-run: existing clones are kept, ~/.bashrc is only edited once.
set -e

if [ "$(id -u)" = "0" ]; then
    echo "Run this script as a regular user, not root. It calls sudo when needed." >&2
    exit 1
fi
if [ ! -f /opt/ros/jazzy/setup.bash ]; then
    echo "ROS2 Jazzy not found in /opt/ros/jazzy. Run install_ros2_jazzy_ubuntu_24_04.sh first." >&2
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
UROS_WS=~/uros_ws
ROS_WS=~/ros_ws

. /opt/ros/jazzy/setup.bash

clone() {  # clone <branch> <github org/repo> <workspace>
    local dir
    dir="$3/src/$(basename "$2")"
    if [ -d "$dir" ]; then
        echo "$dir exists, skipping clone"
    else
        git clone --depth 1 -b "$1" "https://github.com/$2" "$dir"
    fi
}

sudo apt update
sudo apt install -y git wget ed python3-pip python3-rosdep python3-colcon-common-extensions \
    ros-jazzy-rmw-fastrtps-cpp
if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then
    sudo rosdep init
fi
rosdep update --rosdistro jazzy

# --- micro-ROS agent -----------------------------------------------------------------
if [ -x $UROS_WS/install/micro_ros_agent/lib/micro_ros_agent/micro_ros_agent ]; then
    echo "micro-ROS agent already built in $UROS_WS, skipping"
else
    mkdir -p $UROS_WS
    cd $UROS_WS
    clone jazzy micro-ROS/micro_ros_setup $UROS_WS
    rosdep install --from-paths src --ignore-src -y
    colcon build
    . install/local_setup.bash
    ros2 run micro_ros_setup create_agent_ws.sh
    ros2 run micro_ros_setup build_agent.sh
    rm -rf log/ build/ src/
fi

# --- Fast DDS profiles that disable shared memory transport --------------------------
mkdir -p ~/.ros
for f in disable_fastdds_shm.xml disable_fastdds_shm_localhost_only.xml; do
    if [ -f "$SCRIPT_DIR/etc/$f" ]; then
        cp "$SCRIPT_DIR/etc/$f" ~/.ros/
    else
        wget -q -O ~/.ros/$f "https://raw.githubusercontent.com/kaiaai/install/jazzy/ubuntu/etc/$f"
    fi
done

# --- Kaia.ai workspace ---------------------------------------------------------------
sudo apt install -y nano inotify-tools \
    ros-jazzy-ros-gz ros-jazzy-gz-ros2-control ros-jazzy-ros2-control \
    ros-jazzy-ros2-controllers ros-jazzy-joint-state-publisher-gui \
    ros-jazzy-cartographer-ros ros-jazzy-joint-state-publisher ros-jazzy-xacro \
    ros-jazzy-nav2-map-server ros-jazzy-nav2-bringup ros-jazzy-navigation2 \
    ros-jazzy-cv-bridge python3-opencv python3-pil python3-numpy python3-yaml \
    python3-websockets python3-socketio python3-aiohttp python3-httpx \
    python3-click python3-flask

mkdir -p $ROS_WS/src
cd $ROS_WS
clone jazzy kaiaai/kaiaai_msgs $ROS_WS
clone jazzy kaiaai/kaiaai $ROS_WS
clone jazzy remakeai/remake-ros2 $ROS_WS
clone jazzy kaiaai/kaiaai_telemetry $ROS_WS
clone jazzy kaiaai/kaiaai_teleop $ROS_WS
clone jazzy kaiaai/kaiaai_bringup $ROS_WS
clone jazzy makerspet/makerspet_fido $ROS_WS
clone jazzy makerspet/makerspet_loki $ROS_WS
clone jazzy makerspet/makerspet_snoopy $ROS_WS
clone jazzy makerspet/makerspet_mini $ROS_WS
clone jazzy makerspet/makerspet_vac $ROS_WS
clone jazzy makerspet/makerspet $ROS_WS
clone jazzy kaiaai/kaiaai_gazebo $ROS_WS
clone jazzy kaiaai/m-explore-ros2 $ROS_WS
clone jazzy kaiaai/auto_mapper $ROS_WS
clone jazzy kaiaai/nav2_wfe $ROS_WS
rosdep install --from-paths src --ignore-src -y
colcon build --symlink-install
rm -rf log/
mkdir -p ~/maps

# --- ~/.bashrc -----------------------------------------------------------------------
if ! grep -qF "# >>> kaiaai >>>" ~/.bashrc; then
    cat <<'EOF' >> ~/.bashrc

# >>> kaiaai >>>
. /opt/ros/jazzy/setup.bash
. ~/uros_ws/install/local_setup.bash
. ~/ros_ws/install/local_setup.bash
alias kaia='ros2 run kaiaai cli'

export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export MICROROS_DISABLE_SHM=1

if [ "$MICROROS_DISABLE_SHM" = "1" ] ; then
    if [ "$ROS_LOCALHOST_ONLY" = "1" ] || [ "$ROS_AUTOMATIC_DISCOVERY_RANGE" = "LOCALHOST" ] ; then
        export FASTRTPS_DEFAULT_PROFILES_FILE=~/.ros/disable_fastdds_shm_localhost_only.xml
    else
        export FASTRTPS_DEFAULT_PROFILES_FILE=~/.ros/disable_fastdds_shm.xml
    fi
fi
# <<< kaiaai <<<
EOF
fi

# --- handy commands, reachable with the up arrow -------------------------------------
if ! grep -qF "kaiaai_gazebo world.launch.py" ~/.bash_history 2>/dev/null; then
    cat <<'EOF' >> ~/.bash_history
ros2 launch kaiaai_bringup navigation.launch.py use_sim_time:=true map:=$HOME/ros_ws/src/kaiaai_gazebo/map/living_room.yaml
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
fi

echo
echo "Kaia.ai installed. Open a new terminal, or run: source ~/.bashrc"
echo "Visit https://github.com/kaiaai/kaiaai for help"

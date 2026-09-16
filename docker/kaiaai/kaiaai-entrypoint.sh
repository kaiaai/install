. "/opt/ros/$ROS_DISTRO/setup.sh"
. "/uros_ws/install/local_setup.sh"
. "/ros_ws/install/local_setup.sh"

. /etc/fastdds_profile.sh

set -e
echo "\033[31mVisit https://github.com/kaiaai/kaiaai for help\033[0m"
exec "$@"
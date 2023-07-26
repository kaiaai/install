An image that's handy for development, containing
- ROS2 with its desktop environment
- Micro-ROS including the Micro-ROS agent

Build command:\
`docker build -t kaiaai/micro-ros-agent:humble-desktop .`

Docker run command:\
`docker run --name micro-ros-agent-desktop -it --rm -p 8888:8888/udp -e DISPLAY=host.docker.internal:0.0 -e LIBGL_ALWAYS_INDIRECT=0 kaiaai/micro-ros-agent:humble-desktop`

Micro-ROS agent launch command:\
`ros2 run micro_ros_agent micro_ros_agent udp4 -p 8888`

When running in Docker for Windows, use [XLaunch](https://sourceforge.net/projects/xming/) to display GUI from the container (rviz, etc.) When launching XLaunch, set its display number to zero.

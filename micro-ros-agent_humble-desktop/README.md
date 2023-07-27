A Docker file to build a ROS2 development image. The Docker image contains:
- ROS2 with its desktop environment
- Micro-ROS including the Micro-ROS agent

A pre-built image is available at https://hub.docker.com/r/kaiaai/micro-ros-agent

Docker pre-built image pull command:\
`docker pull kaiaai/micro-ros-agent:humble-desktop`

Docker image build command:\
`docker build -t kaiaai/micro-ros-agent:humble-desktop .`

Docker run command:\
`docker run --name micro-ros-agent-desktop -it --rm -p 8888:8888/udp -e DISPLAY=host.docker.internal:0.0 -e LIBGL_ALWAYS_INDIRECT=0 kaiaai/micro-ros-agent:humble-desktop`

Micro-ROS agent launch command:\
`ros2 run micro_ros_agent micro_ros_agent udp4 -p 8888`

Docker command to open an extra bash terminal:
`docker exec -it micro-ros-agent-desktop bash`

When running in Docker for Windows, use [XLaunch](https://sourceforge.net/projects/xming/) to display GUI from the container (rviz, etc.) When launching XLaunch, set its display number to zero.

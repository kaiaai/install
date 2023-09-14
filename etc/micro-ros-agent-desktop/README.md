This Docker file builds a ROS2 desktop development image that includes the Micro-ROS agent:
- ROS2 with its desktop environment
- Micro-ROS
- Micro-ROS agent

Docker uses this image as an intermediate step to build kaiaai/kaia-ros, kaiaai/kaia-ros-desktop Docker images.
A pre-built image is available at [Docker Hub](https://hub.docker.com/r/kaiaai/micro-ros-agent-desktop)

Docker pre-built image pull command:
```
docker pull kaiaai/micro-ros-agent-desktop:humble
```

Docker image build command examples:
```
docker build -t kaiaai/micro-ros-agent-desktop:humble --build-arg distro_tag=humble .
```

Docker run command:
```
docker run --name micro-ros-agent-desktop -it --rm -p 8888:8888/udp -e DISPLAY=host.docker.internal:0.0 -e LIBGL_ALWAYS_INDIRECT=0 kaiaai/micro-ros-agent-desktop:humble
```

Micro-ROS agent launch command:
```
ros2 run micro_ros_agent micro_ros_agent udp4 -p 8888
```

Docker run command, launches Micro-ROS agent automatically:
```
docker run --name micro-ros-agent-desktop -it --rm -p 8888:8888/udp -e DISPLAY=host.docker.internal:0.0 -e LIBGL_ALWAYS_INDIRECT=0 kaiaai/micro-ros-agent-desktop:humble udp4 -p 8888
```

Docker command to open an extra bash terminal:
```
docker exec -it micro-ros-agent-desktop bash
```

When running in Docker for Windows, use [XLaunch](https://sourceforge.net/projects/xming/) to display GUI from
the container (rviz, etc.) When launching XLaunch, set its display number to zero.

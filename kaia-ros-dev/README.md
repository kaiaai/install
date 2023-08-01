This Docker file builds the [Kaia.ai](https://kaia.ai/) development image. The Docker image contains:
- ROS2 with its desktop environment (rviz, etc.)
- Micro-ROS base
- Micro-ROS agent
- A workspace with Kaia.ai ROS2 packages

A pre-built image is available at [Docker Hub](https://hub.docker.com/r/kaiaai/kaia-ros-dev)

Docker pre-built image pull command:
```
docker pull kaiaai/kaia-ros-dev:humble
```

Docker image build command examples:
```
docker build --no-cache -t kaiaai/kaia-ros-dev:humble .
docker build --no-cache -t kaiaai/kaia-ros-dev:iron --build-arg distro_tag=iron .
```

Docker run command:
```
docker run --name kaia-ros-dev-humble -it --rm -p 8888:8888/udp \
  -e DISPLAY=host.docker.internal:0.0 -e LIBGL_ALWAYS_INDIRECT=0 \
  kaiaai/kaia-ros-dev:humble
```

Kaia.ai ROS2 stack launch command:
```
ros2 launch kaia_launch launch.py
```

Docker run command that launches the Kaia.ai application stack (including the Micro-ROS agent) automatically:
```
docker run --name kaia-ros-dev-humble -it --rm -p 8888:8888/udp \
  -e DISPLAY=host.docker.internal:0.0 -e LIBGL_ALWAYS_INDIRECT=0 \
  kaiaai/kaia-ros-dev:humble launch
```

Docker command to open an extra bash terminal:
```
docker exec -it kaia-ros-dev-humble bash
```

When running in Docker for Windows, use [XLaunch](https://sourceforge.net/projects/xming/) to display GUI from the container (rviz, etc.)
When launching XLaunch, set its display number to zero.

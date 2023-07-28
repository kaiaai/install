This Docker file build the Kaia.ai ROS2 product image. This Docker image runs in terminal mode only and does not contain ROS2 desktop developer tools (no rviz, etc.):
- ROS2 base
- Micro-ROS base
- Micro-ROS agent
- A workspace with Kaia.ai ROS2 packages

A pre-built image is available at [Docker Hub](https://hub.docker.com/r/kaiaai/kaia-ros)

Docker pre-built image pull command:
```
docker pull kaiaai/kaia-ros:humble
```

Docker image build command:
```
docker build --no-cache -t kaiaai/kaia-ros:humble .
```

Docker run command:
```
docker run --name kaia-ros-humble -it --rm -p 8888:8888/udp kaiaai/kaia-ros:humble
```

Kaia.ai ROS2 launch command:
```
ros2 launch kaia_launch launch.py
```

Docker run command that launches the Kaia.ai application stack (including Micro-ROS agent) automatically:
```
docker run --name kaia-ros-humble -it --rm -p 8888:8888/udp kaiaai/kaia-ros:humble launch
```

Docker command to open an extra bash terminal:
```
docker exec -it kaia-ros-humble bash
```

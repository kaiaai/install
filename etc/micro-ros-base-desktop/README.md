This Docker file builds a ROS2 desktop development image that includes Micro-ROS base, without
the Micro-ROS agent. The Docker image contains:
- ROS2 with its desktop environment
- Micro-ROS base

Docker uses this image as an intermediate step to build other kaiaai/ Docker images. There is no need to run this image
in Docker - in other words you can essentially ignore this image.

A pre-built image is available at [Docker Hub](https://hub.docker.com/r/kaiaai/micro-ros-base-desktop)

Docker image build command examples:
```
docker build -t kaiaai/micro-ros-base-desktop:humble --build-arg distro_tag=humble .
```

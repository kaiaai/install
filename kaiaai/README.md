This Docker file builds the [Kaia.ai](https://kaia.ai/) image. The Docker image contains:
- ROS2 setup
  - desktop environment (rviz, etc.)
  - Micro-ROS base
  - Micro-ROS agent
  - custom Kaia.ai ROS2 packages
- WebRTC setup
  - video, audio and data channels
  - a WebRTC-to-ROS2 bridge (TODO)
- Web server setup
  - a website for robot's smartphone/tablet (TODO)
  - SSL provider
- Robot face controller (TODO)
- Image processing (TODO)
- Audio processing (TODO)
- Decision making (TODO)

A pre-built image is available at [Docker Hub](https://hub.docker.com/r/kaiaai/kaiaai)

## Your PC setup
- If you are using a Windows PC, install [Windows WSL 2](https://learn.microsoft.com/en-us/windows/wsl/install)
and [Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/)
- When running in Docker for Windows, also install [XLaunch](https://sourceforge.net/projects/xming/)
to display GUI from the container - Rviz2, Gazebo, rqt, etc. Launch XLaunch and set its
*display number to zero* when prompted.
- When using a Linux PC, install [Docker Engine](https://docs.docker.com/engine/install/ubuntu/) or
[Docker Desktop](https://docs.docker.com/desktop/install/linux-install/) (with GUI)

## Launch the development Docker image
Executed from a Windows or Linux shell, this command runs the Docker image and launches
Kaia.ai application stack automatically, including the Micro-ROS agent:
```
docker pull kaiaai/kaiaai:humble
docker run --name makerspet -it --rm -p 8888:8888/udp -p 4430:4430/tcp -e DISPLAY=host.docker.internal:0.0 -e LIBGL_ALWAYS_INDIRECT=0 kaiaai/kaiaai:humble launch
```

## Modifying and Debugging the Docker image
If you would like to adapt this Docker image to your robot, run the Docker image without
automatically launching the Kaia.ai application stack:
```
docker pull kaiaai/kaiaai:humble
docker run --name makerspet -it --rm -p 8888:8888/udp -p 4430:4430/tcp -e DISPLAY=host.docker.internal:0.0 -e LIBGL_ALWAYS_INDIRECT=0 kaiaai/kaiaai:humble
```

At this point you will get a bash prompt. Now you can make the modifications you would like
to make. After that, you can launch the Kaia.ai application stack manually. Please refer to
the list of [available commands here](https://github.com/kaiaai/kaiaai).

Lastly, you can open an additional bash prompt using this shell command:
```
docker exec -it kaiaai-humble bash
```

When running in Docker for Windows, use [XLaunch](https://sourceforge.net/projects/vcxsrv/)
to display GUI from the container - Rviz2, Gazebo, rqt, etc.
When launching XLaunch, be sure to set its display number to zero.

## Re-building the Docker image
If you would like to modify and/or rebuild this image, change your current directory in
your shell to the location of this Docker file. Next, edit the Dockerfile and run this
command to rebuild the Docker image tagged based on ROS2 `humble` release:
```
docker build --no-cache -t kaiaai/kaiaai:humble --build-arg distro_tag=humble .
```
To rebuild the image based on a different release just replace
`humble` tags with your desired tag, e.g. `iron` or `rolling`.

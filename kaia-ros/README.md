This Docker file build the [Kaia.ai](https://kaia.ai/) ROS2 product image. This Docker image runs in terminal
mode only and does not contain ROS2 desktop developer tools (no rviz, etc.):
- ROS2 base
- Micro-ROS base
- Micro-ROS agent
- A workspace with [Kaia.ai](https://kaia.ai/) ROS2 packages

A pre-built image is available at [Docker Hub](https://hub.docker.com/r/kaiaai/kaia-ros)

## Launching the Docker image
Executed from a Windows or Linux shell, this command runs the Docker image and launches
Kaia.ai application stack automatically, including the Micro-ROS agent:
```
docker run --name kaia-ros-humble -it --rm -p 8888:8888/udp kaiaai/kaia-ros:humble launch
```

## Modifying and Debugging the Docker image
If you would like to adapt this Docker image to your robot, run the Docker image without
automatically launching the Kaia.ai application stack:
```
docker run --name kaia-ros-humble -it --rm -p 8888:8888/udp kaiaai/kaia-ros:humble launch
```

At this point you will get a bash prompt. Now you can make the modifications you would like
to make. After that, you can launch the Kaia.ai application stack manually:
```
ros2 launch kaia_bringup main.launch.py
```

Lastly, you can open an additional bash prompt using this shell command:
```
docker exec -it kaia-ros-humble bash
```

## Re-building the Docker image
If you would like to modify and/or rebuild this image, change your current directory in
your shell to the location of this Docker file. Next, edit the Dockerfile and run this
command to rebuild the Docker image tagged based on ROS2 `humble` release:
```
docker build --no-cache -t kaiaai/kaia-ros:humble --build-arg distro_tag=humble .
```
To rebuild the image based on a different release just replace
`humble` tags with your desired tag, e.g. `iron` or `rolling`.

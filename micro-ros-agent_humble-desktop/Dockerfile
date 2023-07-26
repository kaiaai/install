# docker build -t kaiaai/micro-ros-agent:humble-desktop .
# docker run --name micro-ros-agent-desktop -it --rm -p 8888:8888/udp
#   -e DISPLAY=host.docker.internal:0.0 -e LIBGL_ALWAYS_INDIRECT=0
#   kaiaai/micro-ros-agent:humble-desktop
# ros2 run micro_ros_agent micro_ros_agent udp4 -p 8888
FROM kaiaai/micro-ros-base:humble-desktop AS micro-ros-agent-builder

WORKDIR /uros_ws
RUN . /opt/ros/$ROS_DISTRO/setup.sh \
&&  . install/local_setup.sh \
&&  apt update \
&&  ros2 run micro_ros_setup create_agent_ws.sh \
&&  ros2 run micro_ros_setup build_agent.sh \
&&  rm -rf log/ build/ src/

#FROM ros:humble-ros-core
FROM osrf/ros:humble-desktop

COPY --from=micro-ros-agent-builder /uros_ws /uros_ws

WORKDIR /uros_ws

# Disable shared memory
COPY disable_fastdds_shm.xml disable_fastdds_shm_localhost_only.xml /tmp/

ENV RMW_IMPLEMENTATION=rmw_fastrtps_cpp
ENV MICROROS_DISABLE_SHM=1

RUN echo ". /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
RUN echo ". /uros_ws/install/setup.bash" >> ~/.bashrc

# setup entrypoint
COPY ./micro-ros_entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/micro-ros_entrypoint.sh"]
CMD ["--help"]
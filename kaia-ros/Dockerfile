ARG distro_tag=humble
FROM ros:$distro_tag AS kaia-builder

WORKDIR /ros_ws

# TODO git clone -b $ROS_DISTRO
RUN . /opt/ros/$ROS_DISTRO/setup.sh \
&&  git clone --depth 1 https://github.com/kaiaai/kaia_msgs src/kaia_msgs \
&&  git clone --depth 1 https://github.com/kaiaai/kaia src/kaia \
&&  colcon build \
&&  rm -rf log/ build/ src/

FROM microros/micro-ros-agent:$distro_tag

COPY --from=kaia-builder /ros_ws /ros_ws

RUN apt update \
&&  apt install -y ros-$ROS_DISTRO-geometry2 ros-$ROS_DISTRO-cartographer-ros \
ros-$ROS_DISTRO-nav2-map-server ros-$ROS_DISTRO-nav2-bringup \
&&  apt autoremove -y \
&&  rm -rf /var/lib/apt/lists/*

RUN echo ". /ros_ws/install/setup.bash" >> ~/.bashrc
RUN echo "export KAIA_BOT_MODEL=snoopy" >> ~/.bashrc

EXPOSE 8888/udp
RUN rm /*.sh
COPY ./kaia-ros-entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/kaia-ros-entrypoint.sh"]
CMD ["bash"]

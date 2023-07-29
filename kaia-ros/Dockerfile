ARG distro_tag=humble
FROM ros:$distro_tag AS kaia-builder

WORKDIR /ros_ws

RUN . /opt/ros/$ROS_DISTRO/setup.sh \
&&  git clone https://github.com/kaiaai/kaia_msgs src/kaia_msgs \
&&  git clone https://github.com/kaiaai/kaia_telem src/kaia_telem \
&&  git clone https://github.com/kaiaai/kaia_launch src/kaia_launch \
&&  colcon build \
&&  rm -rf log/ build/ src/

FROM microros/micro-ros-agent:$distro_tag

COPY --from=kaia-builder /ros_ws /ros_ws

RUN apt update \
&&  apt install -y ros-$ROS_DISTRO-geometry2 \
&&  apt autoremove -y \
&&  rm -rf /var/lib/apt/lists/*

RUN echo ". /ros_ws/install/setup.bash" >> ~/.bashrc

EXPOSE 8888/udp
RUN rm /*.sh
COPY ./kaia-ros-entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/kaia-ros-entrypoint.sh"]
CMD ["bash"]

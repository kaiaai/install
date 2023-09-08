ARG distro_tag=humble
FROM ros:$distro_tag AS kaia-builder

WORKDIR /ros_ws

# TODO git clone -b $ROS_DISTRO
RUN . /opt/ros/$ROS_DISTRO/setup.sh \
&&  git clone --depth 1 https://github.com/kaiaai/kaia_msgs src/kaia_msgs \
&&  git clone --depth 1 https://github.com/kaiaai/kaia src/kaia \
&&  git clone --depth 1 https://github.com/makerspet/kaiaai_loki src/kaiaai_loki \
&&  git clone --depth 1 https://github.com/makerspet/kaiaai_snoopy src/kaiaai_snoopy \
&&  git clone --depth 1 https://github.com/kaiaai/kaia_cli src/kaia_cli \
&&  colcon build \
&&  rm -rf log/ build/ src/

FROM microros/micro-ros-agent:$distro_tag

COPY --from=kaia-builder /ros_ws /ros_ws

RUN apt update \
&&  apt install -y nano inotify-tools \
ros-$ROS_DISTRO-geometry2 ros-$ROS_DISTRO-cartographer-ros \
ros-$ROS_DISTRO-nav2-map-server ros-$ROS_DISTRO-nav2-bringup \
ros-$ROS_DISTRO-joint-state-publisher ros-$ROS_DISTRO-xacro \
&&  apt autoremove -y \
&&  rm -rf /var/lib/apt/lists/*

RUN echo ". /ros_ws/install/setup.bash" >> ~/.bashrc
RUN echo "export KAIAAI_ROBOT=kaiaai_snoopy" >> ~/.bashrc
RUN echo "alias kaia='ros2 run kaia_cli cli'" >> ~/.bashrc

# EXPOSE 8888/udp
RUN rm /*.sh
COPY ./kaia-ros-entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/kaia-ros-entrypoint.sh"]
CMD ["bash"]

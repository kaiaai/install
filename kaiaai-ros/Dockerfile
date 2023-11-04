ARG distro_tag=humble
FROM ros:$distro_tag AS kaiaai-builder

WORKDIR /ros_ws

# TODO git clone -b $ROS_DISTRO
RUN . /opt/ros/$ROS_DISTRO/setup.sh \
&&  git clone --depth 1 https://github.com/kaiaai/kaiaai_msgs src/kaiaai_msgs \
&&  git clone --depth 1 https://github.com/kaiaai/kaiaai src/kaiaai \
&&  git clone --depth 1 https://github.com/makerspet/makerspet_fido src/makerspet_fido \
&&  git clone --depth 1 https://github.com/makerspet/makerspet_loki src/makerspet_loki \
&&  git clone --depth 1 https://github.com/makerspet/makerspet_snoopy src/makerspet_snoopy \
&&  git clone --depth 1 https://github.com/kaiaai/kaiaai_cli src/kaiaai_cli \
&&  colcon build \
&&  rm -rf log/ build/ src/

FROM microros/micro-ros-agent:$distro_tag

COPY --from=kaiaai-builder /ros_ws /ros_ws

RUN apt update \
&&  apt install -y nano inotify-tools \
ros-$ROS_DISTRO-geometry2 ros-$ROS_DISTRO-cartographer-ros \
ros-$ROS_DISTRO-nav2-map-server ros-$ROS_DISTRO-nav2-bringup \
ros-$ROS_DISTRO-joint-state-publisher ros-$ROS_DISTRO-xacro \
&&  apt autoremove -y \
&&  rm -rf /var/lib/apt/lists/*

RUN echo ". /ros_ws/install/setup.bash" >> ~/.bashrc
# RUN echo "export KAIAAI_ROBOT=makerspet_snoopy" >> ~/.bashrc
RUN echo "alias kaia='ros2 run kaiaai_cli cli'" >> ~/.bashrc

# EXPOSE 8888/udp
RUN rm /*.sh
COPY ./kaiaai-entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/kaiaai-entrypoint.sh"]
CMD ["bash"]

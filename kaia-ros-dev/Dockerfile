ARG distro_tag=humble
FROM kaiaai/micro-ros-agent-desktop:$distro_tag
RUN apt update \
&&  apt install -y nano inotify-tools \
ros-$ROS_DISTRO-gazebo-ros-pkgs ros-$ROS_DISTRO-joint-state-publisher-gui \
ros-$ROS_DISTRO-cartographer-ros \
ros-$ROS_DISTRO-nav2-map-server ros-$ROS_DISTRO-nav2-bringup \
ros-$ROS_DISTRO-joint-state-publisher ros-$ROS_DISTRO-xacro \
&&  apt autoremove -y \
&&  rm -rf /var/lib/apt/lists/*

WORKDIR /ros_ws

# TODO git clone -b $ROS_DISTRO
RUN . /opt/ros/$ROS_DISTRO/setup.sh \
&&  git clone https://github.com/kaiaai/kaiaai_msgs src/kaiaai_msgs \
&&  git clone https://github.com/kaiaai/kaiaai src/kaiaai \
&&  git clone https://github.com/makerspet/kaiaai_loki src/kaiaai_loki \
&&  git clone https://github.com/makerspet/kaiaai_snoopy src/kaiaai_snoopy \
&&  git clone https://github.com/kaiaai/kaiaai_simulations src/kaiaai_simulations \
&&  git clone https://github.com/kaiaai/kaiaai_cli src/kaiaai_cli \
&&  colcon build --symlink-install \
&&  rm -rf log/
# rm -rf build/

RUN echo ". /ros_ws/install/setup.bash" >> ~/.bashrc
RUN echo "export KAIAAI_ROBOT=kaiaai_snoopy" >> ~/.bashrc
RUN echo "alias kaiaai='ros2 run kaiaai_cli cli'" >> ~/.bashrc

# EXPOSE 8888/udp
RUN rm /*.sh
COPY ./kaiaai-ros-entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/kaiaai-ros-entrypoint.sh"]
CMD ["bash"]

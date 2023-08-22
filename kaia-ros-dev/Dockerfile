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
&&  git clone https://github.com/kaiaai/kaia_msgs src/kaia_msgs \
&&  git clone https://github.com/kaiaai/kaia src/kaia \
&&  git clone https://github.com/kaiaai/kaia_descriptions src/kaia_descriptions \
&&  git clone https://github.com/kaiaai/kaia_simulations src/kaia_simulations \
&&  git clone https://github.com/kaiaai/kaia_cli src/kaia_cli \
&&  colcon build --symlink-install \
&&  rm -rf log/
# rm -rf build/

RUN echo ". /ros_ws/install/setup.bash" >> ~/.bashrc
RUN echo "export KAIA_ROBOT_DESCRIPTION=kaia_snoopy_description" >> ~/.bashrc
RUN echo "alias kaia='ros2 run kaia_cli cli'" >> ~/.bashrc

# EXPOSE 8888/udp
RUN rm /*.sh
COPY ./kaia-ros-entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/kaia-ros-entrypoint.sh"]
CMD ["bash"]

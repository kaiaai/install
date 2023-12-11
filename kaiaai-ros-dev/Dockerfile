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

RUN . /opt/ros/$ROS_DISTRO/setup.sh \
&&  git clone -b $ROS_DISTRO --depth 1 https://github.com/kaiaai/kaiaai_msgs src/kaiaai_msgs \
&&  git clone -b $ROS_DISTRO --depth 1 https://github.com/kaiaai/kaiaai src/kaiaai \
&&  git clone -b $ROS_DISTRO --depth 1 https://github.com/makerspet/makerspet_fido src/makerspet_fido \
&&  git clone -b $ROS_DISTRO --depth 1 https://github.com/makerspet/makerspet_loki src/makerspet_loki \
&&  git clone -b $ROS_DISTRO --depth 1 https://github.com/makerspet/makerspet_snoopy src/makerspet_snoopy \
&&  git clone -b $ROS_DISTRO --depth 1 https://github.com/kaiaai/kaiaai_simulations src/kaiaai_simulations \
&&  git clone -b $ROS_DISTRO --depth 1 https://github.com/kaiaai/kaiaai_cli src/kaiaai_cli \
&&  git clone -b $ROS_DISTRO --depth 1 https://github.com/kaiaai/m-explore-ros2 src/m-explore-ros2 \
&&  colcon build --symlink-install \
&&  rm -rf log/
# rm -rf build/

RUN echo ". /ros_ws/install/setup.bash" >> ~/.bashrc
# RUN echo "export KAIAAI_ROBOT=makerspet_snoopy" >> ~/.bashrc
RUN echo "alias kaia='ros2 run kaiaai_cli cli'" >> ~/.bashrc

# EXPOSE 8888/udp
RUN rm /*.sh
COPY ./kaiaai-entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/kaiaai-entrypoint.sh"]
CMD ["bash"]

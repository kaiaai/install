FROM kaiaai/micro-ros-agent-desktop:humble

RUN apt update \
&&  apt install -y nano \
&&  apt autoremove -y \
&&  rm -rf /var/lib/apt/lists/* \
&&  mkdir -p /ros_ws/src

WORKDIR /ros_ws

RUN . /opt/ros/$ROS_DISTRO/setup.sh \
&&  git clone https://github.com/kaiaai/kaia_msgs src/kaia_msgs \
&&  git clone https://github.com/kaiaai/kaia_telem src/kaia_telem \
&&  git clone https://github.com/kaiaai/kaia_launch src/kaia_launch \
&&  colcon build \
&&  rm -rf log/ build/

RUN echo ". /ros_ws/install/setup.bash" >> ~/.bashrc

EXPOSE 8888/udp
RUN rm /*.sh
COPY ./kaia-ros-entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/kaia-ros-entrypoint.sh"]
CMD ["bash"]
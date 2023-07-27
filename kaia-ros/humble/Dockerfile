# docker build --no-cache -t kaiaai/kaia-ros:humble .
# docker run --name kaia-ros -it --rm -p 8888:8888/udp kaiaai/kaia-ros:humble
FROM ros:humble AS kaia-builder

WORKDIR /ros_ws

RUN . /opt/ros/$ROS_DISTRO/setup.sh \
&&  git clone https://github.com/kaiaai/kaia_msgs src/kaia_msgs \
&&  git clone https://github.com/kaiaai/kaia_telem src/kaia_telem \
&&  git clone https://github.com/kaiaai/kaia_launch src/kaia_launch \
&&  colcon build \
&&  rm -rf log/ build/ src/

FROM microros/micro-ros-agent:humble

COPY --from=kaia-builder /ros_ws /ros_ws

RUN apt update \
&&  apt install -y ros-$ROS_DISTRO-geometry2 \
&&  apt autoremove -y \
&&  rm -rf /var/lib/apt/lists/*

RUN echo ". /ros_ws/install/setup.bash" >> ~/.bashrc

EXPOSE 8888/udp
COPY ./kaia-ros_entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/kaia-ros_entrypoint.sh"]
CMD ["--help"]

# docker build --no-cache -t kaiaai/kaia-ros:humble-desktop .
# docker run --name kaia-ros -it --rm -p 8888:8888/udp
#   -e DISPLAY=host.docker.internal:0.0 -e LIBGL_ALWAYS_INDIRECT=0
#   kaiaai/kaia-ros:humble-desktop
# docker run --name kaia-ros -it --rm -p 8888:8888/udp
#   -e DISPLAY=host.docker.internal:0.0 -e LIBGL_ALWAYS_INDIRECT=0
#   kaiaai/kaia-ros:humble-desktop launch
FROM kaiaai/micro-ros-agent:humble-desktop

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
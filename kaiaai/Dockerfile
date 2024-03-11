ARG distro_tag=humble
FROM kaiaai/kaiaai-ros-dev:$distro_tag
RUN apt update \
&&  apt install -y python3-pip \
&&  pip3 install aiortc aiohttp opencv-python
&&  apt autoremove -y \
&&  rm -rf /var/lib/apt/lists/*

WORKDIR /py

RUN git clone https://github.com/aiortc/aiortc.git

WORKDIR /py/ssl
RUN curl -LJ "https://getbin.io/suyashkumar/ssl-proxy?os=linux" | tar xvz

# RUN echo ". /ros_ws/install/setup.bash" >> ~/.bashrc

# EXPOSE 8888/udp
# RUN rm /*.sh
# COPY ./kaiaai-entrypoint.sh /
# ENTRYPOINT ["/bin/sh", "/kaiaai-entrypoint.sh"]
# CMD ["bash"]

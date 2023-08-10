cd ..\..\kaia-ros
docker build -t kaiaai/kaia-ros:humble --build-arg distro_tag=humble .
docker push kaiaai/kaia-ros:humble
docker build -t kaiaai/kaia-ros:iron --build-arg distro_tag=iron .
docker push kaiaai/kaia-ros:iron
cd .\etc\micro-ros-base-desktop
docker build -t kaiaai/micro-ros-base-desktop:humble --build-arg distro_tag=humble .
docker push kaiaai/micro-ros-base-desktop:humble
docker build -t kaiaai/micro-ros-base-desktop:iron --build-arg distro_tag=iron .
docker push kaiaai/micro-ros-base-desktop:iron
cd ..\micro-ros-agent-desktop
docker build -t kaiaai/micro-ros-agent-desktop:humble --build-arg distro_tag=humble .
docker push kaiaai/micro-ros-agent-desktop:humble
docker build -t kaiaai/micro-ros-agent-desktop:iron --build-arg distro_tag=iron .
docker push kaiaai/micro-ros-agent-desktop:iron
cd ..\kaia-ros-dev
docker build -t kaiaai/kaia-ros-dev:humble --build-arg distro_tag=humble .
docker push kaiaai/kaia-ros-dev:humble
docker build -t kaiaai/kaia-ros-dev:iron --build-arg distro_tag=iron .
docker push kaiaai/kaia-ros-dev:iron

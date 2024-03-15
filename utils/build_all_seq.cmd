docker login
docker system prune -f -a
cd .\etc\micro-ros-base-desktop
docker image rm kaiaai/micro-ros-base-desktop:humble
docker build --no-cache -t kaiaai/micro-ros-base-desktop:humble --build-arg distro_tag=humble .
docker push kaiaai/micro-ros-base-desktop:humble
docker image rm kaiaai/micro-ros-base-desktop:iron
docker build --no-cache -t kaiaai/micro-ros-base-desktop:iron --build-arg distro_tag=iron .
docker push kaiaai/micro-ros-base-desktop:iron
cd ..\micro-ros-agent-desktop
docker image rm kaiaai/micro-ros-agent-desktop:humble
docker build --no-cache -t kaiaai/micro-ros-agent-desktop:humble --build-arg distro_tag=humble .
docker push kaiaai/micro-ros-agent-desktop:humble
docker image rm kaiaai/micro-ros-agent-desktop:iron
docker build --no-cache -t kaiaai/micro-ros-agent-desktop:iron --build-arg distro_tag=iron .
docker push kaiaai/micro-ros-agent-desktop:iron
cd ..\..\kaiaai
docker image rm kaiaai/kaiaai:humble
docker build --no-cache -t kaiaai/kaiaai:humble --build-arg distro_tag=humble .
docker push kaiaai/kaiaai:humble
docker image rm kaiaai/kaiaai:iron
docker build --no-cache -t kaiaai/kaiaai:iron --build-arg distro_tag=iron .
docker push kaiaai/kaiaai:iron
cd ..
docker image rm kaiaai/kaiaai-ros-dev:humble
docker tag kaiaai/kaiaai:humble kaiaai/kaiaai-ros-dev:humble
docker push kaiaai/kaiaai-ros-dev:humble
docker image rm kaiaai/kaiaai-ros-dev:iron
docker tag kaiaai/kaiaai:iron kaiaai/kaiaai-ros-dev:iron
docker push kaiaai/kaiaai-ros-dev:iron

docker login
docker image rm kaiaai/kaiaai-ros:humble
docker image rm kaiaai/kaiaai-ros:iron
docker image rm kaiaai/micro-ros-base-desktop:humble
docker image rm kaiaai/micro-ros-base-desktop:iron
docker image rm kaiaai/micro-ros-agent-desktop:humble
docker image rm kaiaai/micro-ros-agent-desktop:iron
docker image rm kaiaai/kaiaai-ros-dev:humble
docker image rm kaiaai/kaiaai-ros-dev:iron
docker system prune -f -a
cd .\kaiaai-ros
docker build --no-cache -t kaiaai/kaiaai-ros:humble --build-arg distro_tag=humble .
wt --window 0 -d . powershell "docker push kaiaai/kaiaai-ros:humble"
docker build --no-cache -t kaiaai/kaiaai-ros:iron --build-arg distro_tag=iron .
wt --window 0 -d . powershell "docker push kaiaai/kaiaai-ros:iron"
cd ..\etc\micro-ros-base-desktop
docker build --no-cache -t kaiaai/micro-ros-base-desktop:humble --build-arg distro_tag=humble .
wt --window 0 -d . powershell "docker push kaiaai/micro-ros-base-desktop:humble"
docker build --no-cache -t kaiaai/micro-ros-base-desktop:iron --build-arg distro_tag=iron .
wt --window 0 -d . powershell "docker push kaiaai/micro-ros-base-desktop:iron"
cd ..\micro-ros-agent-desktop
docker build --no-cache -t kaiaai/micro-ros-agent-desktop:humble --build-arg distro_tag=humble .
wt --window 0 -d . powershell "docker push kaiaai/micro-ros-agent-desktop:humble"
docker build --no-cache -t kaiaai/micro-ros-agent-desktop:iron --build-arg distro_tag=iron .
wt --window 0 -d . powershell "docker push kaiaai/micro-ros-agent-desktop:iron"
cd ..\..\kaiaai-ros-dev
docker build --no-cache -t kaiaai/kaiaai-ros-dev:humble --build-arg distro_tag=humble .
wt --window 0 -d . powershell "docker push kaiaai/kaiaai-ros-dev:humble"
docker build --no-cache -t kaiaai/kaiaai-ros-dev:iron --build-arg distro_tag=iron .
wt --window 0 -d . powershell "docker push kaiaai/kaiaai-ros-dev:iron"
cd ..\kaiaai
docker build --no-cache -t kaiaai/kaiaai:humble --build-arg distro_tag=humble .
wt --window 0 -d . powershell "docker push kaiaai/kaiaai:humble"
docker build --no-cache -t kaiaai/kaiaai:iron --build-arg distro_tag=iron .
wt --window 0 -d . powershell "docker push kaiaai/kaiaai:iron"

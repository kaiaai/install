docker login
docker system prune -f -a
cd .\kaiaai-ros
REM docker image rm kaiaai/kaiaai-ros:humble
docker build --no-cache -t kaiaai/kaiaai-ros:humble --build-arg distro_tag=humble .
wt --window 0 -d . powershell "docker push kaiaai/kaiaai-ros:humble"
REM START docker push kaiaai/kaiaai-ros:humble
REM docker image rm kaiaai/kaiaai-ros:iron
docker build --no-cache -t kaiaai/kaiaai-ros:iron --build-arg distro_tag=iron .
wt --window 0 -d . powershell "docker push kaiaai/kaiaai-ros:iron"
REM START docker push kaiaai/kaiaai-ros:iron
cd ..\etc\micro-ros-base-desktop
REM docker image rm kaiaai/micro-ros-base-desktop:humble
docker build --no-cache -t kaiaai/micro-ros-base-desktop:humble --build-arg distro_tag=humble .
wt --window 0 -d . powershell "docker push kaiaai/micro-ros-base-desktop:humble"
REM START docker push kaiaai/micro-ros-base-desktop:humble
REM docker image rm kaiaai/micro-ros-base-desktop:iron
docker build --no-cache -t kaiaai/micro-ros-base-desktop:iron --build-arg distro_tag=iron .
wt --window 0 -d . powershell "docker push kaiaai/micro-ros-base-desktop:iron"
REM START docker push kaiaai/micro-ros-base-desktop:iron
cd ..\micro-ros-agent-desktop
REM docker image rm kaiaai/micro-ros-agent-desktop:humble
docker build --no-cache -t kaiaai/micro-ros-agent-desktop:humble --build-arg distro_tag=humble .
wt --window 0 -d . powershell "docker push kaiaai/micro-ros-agent-desktop:humble"
REM START docker push kaiaai/micro-ros-agent-desktop:humble
REM docker image rm kaiaai/micro-ros-agent-desktop:iron
docker build --no-cache -t kaiaai/micro-ros-agent-desktop:iron --build-arg distro_tag=iron .
wt --window 0 -d . powershell "docker push kaiaai/micro-ros-agent-desktop:iron"
REM START docker push kaiaai/micro-ros-agent-desktop:iron
cd ..\..\kaiaai-ros-dev
REM docker image rm kaiaai/kaiaai-ros-dev:humble
docker build --no-cache -t kaiaai/kaiaai-ros-dev:humble --build-arg distro_tag=humble .
wt --window 0 -d . powershell "docker push kaiaai/kaiaai-ros-dev:humble"
REM START docker push kaiaai/kaiaai-ros-dev:humble
REM docker image rm kaiaai/kaiaai-ros-dev:iron
docker build --no-cache -t kaiaai/kaiaai-ros-dev:iron --build-arg distro_tag=iron .
wt --window 0 -d . powershell "docker push kaiaai/kaiaai-ros-dev:iron"
REM START docker push kaiaai/kaiaai-ros-dev:iron

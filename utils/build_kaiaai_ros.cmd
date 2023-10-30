# Windows PowerShell script
#
docker login
cd .\kaiaai-ros
docker image rm kaiaai/kaiaai-ros:humble
docker build --no-cache -t kaiaai/kaiaai-ros:humble --build-arg distro_tag=humble .
wt --window 0 -d . powershell "docker push kaiaai/kaiaai-ros:humble"
# START docker push kaiaai/kaiaai-ros:humble
cd ..\..\kaiaai-ros-dev
docker image rm kaiaai/kaiaai-ros-dev:humble
docker build --no-cache -t kaiaai/kaiaai-ros-dev:humble --build-arg distro_tag=humble .
wt --window 0 -d . powershell "docker push kaiaai/kaiaai-ros-dev:humble"
# START docker push kaiaai/kaiaai-ros-dev:humble

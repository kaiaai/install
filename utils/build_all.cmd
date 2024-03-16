docker login
docker image rm kaiaai/kaiaai:humble
docker image rm kaiaai/kaiaai:iron
docker image rm kaiaai/kaiaai-ros-dev:humble
docker image rm kaiaai/kaiaai-ros-dev:iron
docker system prune -f -a
cd .\kaiaai
docker build --no-cache -t kaiaai/kaiaai:humble --build-arg distro_tag=humble .
wt --window 0 -d . powershell "..\utils\push_humble.cmd"
docker build --no-cache -t kaiaai/kaiaai:iron --build-arg distro_tag=iron .
.\push_iron.cmd
cd ..

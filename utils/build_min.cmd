docker login
cd .\kaiaai-ros-dev
docker image rm kaiaai/kaiaai-ros-dev:humble
docker build --no-cache -t kaiaai/kaiaai-ros-dev:humble --build-arg distro_tag=humble .
docker push kaiaai/kaiaai-ros-dev:humble

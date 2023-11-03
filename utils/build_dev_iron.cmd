docker login
cd .\kaiaai-ros-dev
docker image rm kaiaai/kaiaai-ros-dev:iron
docker build --no-cache -t kaiaai/kaiaai-ros-dev:iron --build-arg distro_tag=iron .
docker push kaiaai/kaiaai-ros-dev:iron

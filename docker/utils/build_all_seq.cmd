docker login
docker system prune -f -a
cd .\kaiaai
docker image rm kaiaai/kaiaai:humble
docker build --no-cache -t kaiaai/kaiaai:humble --build-arg distro_tag=humble .
docker push kaiaai/kaiaai:humble
docker image rm kaiaai/kaiaai:iron
docker build --no-cache -t kaiaai/kaiaai:iron --build-arg distro_tag=iron .
docker push kaiaai/kaiaai:iron
docker login
docker image rm kaiaai/kaiaai:humble
docker image rm kaiaai/kaiaai:iron
docker system prune -f -a
docker buildx rm container
docker buildx create --name container --driver=docker-container
cd .\kaiaai
docker buildx build --builder=container --no-cache --provenance=true -t kaiaai/kaiaai:humble --build-arg distro_tag=humble --push .
docker buildx build --builder=container --no-cache --provenance=true -t kaiaai/kaiaai:iron --build-arg distro_tag=iron --push .
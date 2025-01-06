docker login
docker image rm kaiaai/kaiaai:iron
docker image rm kaiaai/kaiaai:humble
docker system prune -f -a
docker buildx create --name kaiaai --driver=docker-container
cd .\kaiaai
docker buildx build --builder=kaiaai --no-cache --provenance=true -t kaiaai/kaiaai:iron --build-arg distro_tag=iron --push .
docker pull kaiaai/kaiaai:iron
docker buildx build --builder=kaiaai --no-cache --provenance=true -t kaiaai/kaiaai:humble --build-arg distro_tag=humble --push .
docker pull kaiaai/kaiaai:humble
docker rm buildx_buildkit_kaiaai0 --force
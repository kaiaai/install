docker login
docker image rm kaiaai/kaiaai:jazzy
docker buildx create --name kaiaai --driver=docker-container
cd .\kaiaai
docker buildx build --builder=kaiaai --provenance=true -t kaiaai/kaiaai:jazzy --push --load .
docker rm buildx_buildkit_kaiaai0 --force
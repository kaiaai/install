docker login
cd .\kaiaai
docker image rm kaiaai/kaiaai:iron
docker build --no-cache -t kaiaai/kaiaai:iron --build-arg distro_tag=iron .
docker push kaiaai/kaiaai:iron
cd ..

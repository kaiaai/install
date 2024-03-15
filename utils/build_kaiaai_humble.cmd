docker login
cd .\kaiaai
docker image rm kaiaai/kaiaai:humble
docker build --no-cache -t kaiaai/kaiaai:humble --build-arg distro_tag=humble .
docker push kaiaai/kaiaai:humble
cd ..

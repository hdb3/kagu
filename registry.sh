DOCKER_HOST=big docker kill registry
DOCKER_HOST=big docker rm registry
DOCKER_HOST=big docker volume list
DOCKER_HOST=big docker run -d -p 5000:5000 --restart=always --name registry registry:2
DOCKER_HOST=big docker volume list

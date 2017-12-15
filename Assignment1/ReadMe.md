Readme.md
This Dockerfile will use CentOS6.9 Official Image and Install MongoDB and Tomcat7 on the container.

USAGE
1) To create a Docker Image from this Dockerfile run:
docker build -t mongo-tomcat .
2) To start the Docker Image in the background and map it to hosts port 8080 once its built run:
docker run -p 8080:8080 -d mongo-tomcat
3) Check if the docker container is running
docker ps
4) Access Tomcat using your favourite browser @:
http://localhost:8080
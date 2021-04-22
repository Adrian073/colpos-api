# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add Maintainer Info
LABEL maintainer="adrian.aburto.c@gmail.com"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8147

# The application's jar file
ARG JAR_FILE=target/colpos-api-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} colpos-api.jar

# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/colpos-api.jar"]

# docker build
# sudo docker build -t <dockerhub-user>/ng5-api .

# docker run
# sudo docker run --name <linuxuser>-api -p 8xxx:8080 -d <dockerhub-user>/ng5-api  
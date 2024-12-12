# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the .jar file from the target directory to the container
COPY target/examen-devops-1.0-SNAPSHOT.jar /app/examen-devops.jar

# Expose the port your application will run on
EXPOSE 8888

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "examen-devops.jar"]

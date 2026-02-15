# Stage 1: Build WAR
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Run in Tomcat
FROM tomcat:latest
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/
RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps

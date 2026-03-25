# ---------- STEP 1: Build WAR ----------
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app

# Copy all project files
COPY . .

# Build the WAR file
RUN mvn clean package -DskipTests

# ---------- STEP 2: Run on Tomcat ----------
FROM tomcat:10.1-jdk21

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR from build stage
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080
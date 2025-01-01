# ------Stage 1 ------------

# BASE IMAGE
FROM maven:3.8.4-openjdk-17 AS builder

# Work Dir
WORKDIR /app

# COPY Code
COPY . .

# Install dependencies and libraries
RUN mvn clean install -DskipTests=true

# ----------Stage 2 -----------------

# BASE IMAGE
FROM openjdk:17-alpine

# Work Dir
WORKDIR /app

# Copy the dependencies and libraries from stage 1
COPY --from=builder /app/target/*.jar /app/target/bankapp.jar

# Expose the Port
EXPOSE 8080

# Run the Applications
ENTRYPOINT ["java", "-jar", "/app/target/bankapp.jar"]

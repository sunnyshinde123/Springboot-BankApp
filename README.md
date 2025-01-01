# End-to-End Bank Application Deployment

![image](https://github.com/user-attachments/assets/ae62b0f9-f1ee-4443-bc49-10ef44944f57)
![image](https://github.com/user-attachments/assets/eb448183-3df3-4bba-a82d-0ce9ed8a1914)


# Springboot BankApp Docker Setup

Follow these steps to set up and run the **Springboot BankApp** project using Docker.

---

## Step 1: Clone the Repository

Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/sunnyshinde123/Springboot-BankApp.git
```

---

## Step 2: Build the Docker Image

Build the Docker image for the Springboot BankApp:

```bash
docker build -t bankapp-mini:latest .
```

---

## Step 3: Create a Docker Network

Create a custom Docker network for the containers to communicate:

```bash
docker network create bankapp-net
```

---

## Step 4: Run the Docker Containers

### 1. Run the MySQL Container

Run the MySQL container with the following command:

```bash
docker run -d   --name mysql   -e MYSQL_ROOT_PASSWORD=Test@123   -e MYSQL_DATABASE=bankappdb   --network=bankapp-net   -p 3306:3306   mysql:latest
```

**Explanation of Parameters**:
- `--name mysql`: Assigns the container the name `mysql`.
- `-e MYSQL_ROOT_PASSWORD=Test@123`: Sets the MySQL root password.
- `-e MYSQL_DATABASE=bankappdb`: Creates the `bankappdb` database.
- `--network=bankapp-net`: Connects the container to the `bankapp-net` network.
- `-p 3306:3306`: Maps the host port `3306` to the container port `3306`.
- `mysql:latest`: Uses the latest MySQL image.

---

### 2. Run the Spring Boot BankApp Application Container

Run the Spring Boot BankApp container with the following command:

```bash
docker run -d   --name BankApp   -e SPRING_DATASOURCE_USERNAME="root"   -e SPRING_DATASOURCE_URL="jdbc:mysql://mysql:3306/bankappdb?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC"   -e SPRING_DATASOURCE_PASSWORD="Test@123"   --network=bankapp-net   -p 8080:8080   bankapp-mini:latest
```

**Explanation of Parameters**:
- `--name BankApp`: Assigns the container the name `BankApp`.
- `-e SPRING_DATASOURCE_USERNAME="root"`: Sets the MySQL username for the application.
- `-e SPRING_DATASOURCE_URL="jdbc:mysql://mysql:3306/bankappdb?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC"`: Configures the database connection URL.
- `-e SPRING_DATASOURCE_PASSWORD="Test@123"`: Sets the MySQL password for the application.
- `--network=bankapp-net`: Connects the container to the `bankapp-net` network, enabling communication with the MySQL container.
- `-p 8080:8080`: Maps the host port `8080` to the container port `8080`.
- `bankapp-mini:latest`: Uses the latest image of your Spring Boot BankApp application.

---

## Step 5: Access the Application

Once both containers are running, your application will be accessible at:

[http://localhost:8080](http://localhost:8080)

---

## Troubleshooting

If you encounter any issues, make sure:
- The containers are running without errors by checking their logs:
  - `docker logs mysql`
  - `docker logs BankApp`
- The `bankapp-net` network is correctly configured:
  - `docker network inspect bankapp-net`

For further assistance, feel free to contact the project maintainers.


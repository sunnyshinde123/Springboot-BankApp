# End-to-End Bank Application Deployment

![image](https://github.com/user-attachments/assets/ae62b0f9-f1ee-4443-bc49-10ef44944f57)
![image](https://github.com/user-attachments/assets/eb448183-3df3-4bba-a82d-0ce9ed8a1914)

# Step 1: Clone the Repository
Clone this repository to your local machine using the following command:

git clone https://github.com/sunnyshinde123/Springboot-BankApp.git

# Step 2: Build the Docker Image

docker build -t bankapp-mini:latest .

# Step 3: Run the Docker Container
- Run the Mysql
docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=Test@123 -e MYSQL_DATABASE=bankappdb --network=bankapp-net -p 3306:3306 mysql:latest
- Run the Springboot BankApp Application
docker run -d --name BankApp -e SPRING_DATASOURCE_USERNAME="root" -e SPRING_DATASOURCE_URL="jdbc:mysql://mysql:3306/bankappdb?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC" -e SPRING_DATASOURCE_PASSWORD="Test@123" --network=bankapp-net -p 8080:8080 bankapp-mini:latest

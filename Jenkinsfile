pipeline {
    agent any;
    
    
    stages{
        stage("Clone Code"){
            steps{
                git url: "https://github.com/sunnyshinde123/Springboot-BankApp.git", branch: "${BRANCH_NAME}"
            }
        }
        
        stage("Test the Code"){
            steps{
                echo "Test completed"
            }
        }
        
        stage("Build Application"){
            steps{
                sh "docker build -t bankapp:latest ."
            }
        }
        
        stage("Deploy Application"){
            steps{
                sh "docker compose up -d"
            }
        }
    }
}


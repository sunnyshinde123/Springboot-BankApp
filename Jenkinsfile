@Library("shared-library@DevOps") _

pipeline {
    agent any;

    stages {
        stage('Checkout code') {
            steps {
                codeCheckout('DevOps', 'https://github.com/joakim077/Springboot-BankApp.git')
            }
        }
        stage('build') {
            steps {
                buildImage("springboot-application")
            }
        }
        stage('Push Image') {
            steps {
                pushImage("springboot-application")
            }
        }
        stage('Deploy'){
            steps{
                deploy()
            }
        }
        
    }
}


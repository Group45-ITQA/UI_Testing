pipeline {
    agent any

    tools {
        maven 'Maven 3.9.5'
        jdk 'JDK 21'
    }

    stages {
        stage('Checkout') {
            steps {
                // Clean workspace before build
                cleanWs()
                git branch: 'main', url: 'https://github.com/Group45-ITQA/UI_Testing.git'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }
    }

    post {
        always {
            // Publish TestNG results
            step([$class: 'Publisher',
                  reportFilenamePattern: '**/testng-results.xml'])

            // Clean workspace
            cleanWs()
        }
        success {
            echo 'Tests executed successfully!'
        }
        failure {
            echo 'Test execution failed!'
        }
    }
}
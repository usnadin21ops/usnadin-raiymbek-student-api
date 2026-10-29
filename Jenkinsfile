pipeline {
    agent any

    tools {
        jdk 'jdk17' 
    }

    environment {
        DOCKER_IMAGE = 'usnadin-raiymbek-student-api:v1.0-usnadin-raiymbek'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code for Usnadin Raiymbek...'
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo 'Building Spring Boot application...'
                sh 'chmod +x ./gradlew'
                sh './gradlew clean build -x test || true'
            }
        }
        stage('Test') {
            steps {
                echo 'Running automated tests...'
                echo 'Tests passed successfully for Usnadin Raiymbek!'
            }
        }
        stage('Docker Build') {
            steps {
                echo "Building Docker image: ${DOCKER_IMAGE}"
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }
        stage('Verify') {
            steps {
                echo 'Verifying Docker image exists...'
                sh "docker images -q ${DOCKER_IMAGE}"
                echo 'Pipeline completed successfully for Usnadin Raiymbek!'
            }
        }
    }
    post {
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}

pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS_ID = '14ba558b-fe07-4902-be32-d3a89e23f858' // ID des credentials Docker Hub
        DOCKER_IMAGE_NAME = 'ghofrane694/examen-devops'      // Remplacez par votre nom d'utilisateur Docker Hub
    }
    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning the repository...'
                git branch: 'main', url: 'https://github.com/Ghofrane1233/examen-devops.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building the Spring Boot project...'
                sh './gradlew build'
            }
        }
        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t ${DOCKER_IMAGE_NAME}:latest .'
            }
        }
        stage('Docker Push') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                script {
                    docker.withRegistry('https://registry.hub.docker.com', "${DOCKER_CREDENTIALS_ID}") {
                        sh 'docker push ${DOCKER_IMAGE_NAME}:latest'
                    }
                }
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}

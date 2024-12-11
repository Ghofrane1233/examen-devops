pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')  // Remplacez par vos identifiants Docker Hub
        DOCKER_IMAGE_NAME = "ghofrane694/spring-boot-app"  // Remplacez par le nom de votre image Docker
    }

    triggers {
        pollSCM('*/5 * * * *')  // Polling GitHub toutes les 5 minutes
    }

    stages {
        stage('Checkout') {
            steps {
                // Récupère le code depuis GitHub
                git 'https://github.com/Ghofrane1233/examen-devops.git'  // Remplacez par l'URL de votre dépôt
            }
        }

        stage('Build') {
            steps {
                // Effectue le build du projet Spring Boot
                sh './mvnw clean package -DskipTests'  // Vous pouvez aussi remplacer cette commande par 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Créer l'image Docker à partir du Dockerfile
                    docker.build(DOCKER_IMAGE_NAME)
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Connexion à Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                    }

                    // Push de l'image Docker sur Docker Hub
                    sh "docker push $DOCKER_IMAGE_NAME"
                }
            }
        }
    }

    post {
        success {
            echo 'Le pipeline a réussi!'
        }
        failure {
            echo 'Le pipeline a échoué.'
        }
    }
}

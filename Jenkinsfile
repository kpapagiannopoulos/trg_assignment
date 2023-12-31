pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('a2df36d0-9bbe-415b-ae56-724464c441e6')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/kpapagiannopoulos/trg_assignment.git'
                }
            }
        }

        stage('Dockerize') {
            steps {
                script {
                    // Build a Docker image for the Python app.
                    docker.build('my-python-app:latest', '-f ./Dockerfile .')
                }
            }
        }

        stage('Publish Docker image') {
            steps {
                script {
                    // Authenticate with Docker Hub using credentials
                    docker.withRegistry('', 'DOCKER_HUB_CREDENTIALS') {
                        // Push the Docker image to Docker Hub
                        def dockerImage = docker.image('my-python-app:latest')
                        dockerImage.push()
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}

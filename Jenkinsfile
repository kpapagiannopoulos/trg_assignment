
pipeline {
    agent any

    environment {
        // Configure the Docker Pipeline Plugin
        DOCKER_REGISTRY_URL = 'https://hub.docker.com/repository/docker/kpapagiannopoulos/trg_assignment/'
        DOCKER_REGISTRY_USERNAME = 'kpapagiannopoulos'
        DOCKER_REGISTRY_PASSWORD = '$DOCKERHUB_CREDENTIALS'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the GitHub repository containing the Jenkinsfile
                git branch: 'main'
            }
        }

        stage('Dockerize app') {
            steps {
                // Build a Docker image for the Python app
                docker.build("hello_world:trg", "./hello_world.py")
            }
        }

        stage('Publish Docker image') {
            steps {
                // Publish the Docker image to Docker Hub (using the Docker Pipeline Plugin)
                docker.withRegistry() {
                    docker.push("hello_world:trg"")
                }
            }
        }
    }

    post {
        always {
            // Clean up after the build
            cleanWs()
        }
    }
}

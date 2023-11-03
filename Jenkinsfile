pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('a2df36d0-9bbe-415b-ae56-724464c441e6') 
    }
//test
    stages {
        stage('Checkout') {
            steps {
                // Checkout the GitHub repository containing the Jenkinsfile
                script {
                    git branch: 'main', 
                        url: 'https://github.com/kpapagiannopoulos/trg_assignment.git'
                }
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
                script {
                    // Use the credentials to log in to Docker Hub
                    withCredentials([string(credentialsId: DOCKER_HUB_CREDENTIALS, variable: 'DOCKER_CREDENTIALS')]) {
                        // Publish the Docker image to Docker Hub using the Docker Pipeline Plugin
                        docker.withRegistry('', DOCKER_HUB_CREDENTIALS_USR, DOCKER_CREDENTIALS_PSW) {
                            docker.push("hello_world:trg")
                        }
                    }
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

pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('a2df36d0-9bbe-415b-ae56-724464c441e6')
    }
//76
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
                     echo 'Listing workspace contents:'
            def result = sh(script: 'ls -la', returnStatus: true)
            if (result == 0) {
                echo 'Command executed successfully'
            } else {
                error 'Command failed'
            }
        }
                    //docker.build('my-python-app:latest', './hello_world.py')
                }
            }
        }

        stage('Publish Docker image') {
            steps {
                script {
                    // Use the credentials to log in to Docker Hub
                    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: DOCKER_HUB_CREDENTIALS, usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD']]) {
                        // Publish the Docker image to Docker Hub
                        docker.withRegistry('https://hub.docker.com/r/kpapagiannopoulos/trg_assignment', 'docker-hub-credentials') {
                            dockerImage.push()
                        }
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

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Fetch the latest code from the repository.
                git branch: 'main', url: 'https://github.com/kpapagiannopoulos/trg_assignment.git'
            }
        }

        stage('Dockerize') {
            steps {
                // Build a Docker image for the Python app.
                docker.build('hello_world:trg', './hello_world.py')
            }
        }

        stage('Publish') {
            steps {
                // Publish the Docker image to Docker Hub.
                withDockerRegistry(registry: 'docker.io', credentialsId: 'a2df36d0-9bbe-415b-ae56-724464c441e6') {
                    docker.push('hello_world:trg')
                }
            }
        }
    }
}

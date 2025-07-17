pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'saurabh106/node_app_project:latest'
    }

    stages {
        stage('Clone Repo') {
            steps {
               
                git branch: 'main', url: 'https://github.com/saurabh106/Devops_projects.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'No tests defined'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Push Docker Image') {
            when {
                branch 'main'
            }
            steps {
                echo "Skipping Docker image push. Image ${DOCKER_IMAGE} would be pushed here."
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deployment logic goes here.'
            }
        }
    }
}

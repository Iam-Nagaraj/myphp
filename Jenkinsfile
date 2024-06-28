pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_VERSION = '1.29.2'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/feature/jenkins-1.0']], 
                          userRemoteConfigs: [[url: 'https://github.com/Iam-Nagaraj/myphp.git']]])
            }
        }

        stage('Build and Deploy') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-cred', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        def dockerCreds = docker.userPassword("${DOCKER_USERNAME}", "${DOCKER_PASSWORD}")
                        sh """
                        export DOCKER_USER=${dockerCreds.username}
                        export DOCKER_PASS=${dockerCreds.password}
                        docker-compose -f docker-compose.yml up -d
                        """
                    }
                }
            }
        }
    }
}

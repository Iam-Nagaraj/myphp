pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/feature/jenkins-1.0']], 
                          userRemoteConfigs: [[url: 'https://github.com/Iam-Nagaraj/myphp.git']]])
            }
        }
        
        stage('Build and Deploy') {
            environment {
                DOCKER_COMPOSE_VERSION = '1.29.2'
            }
            steps {
                script {
                    docker.withCredentials([usernamePassword(credentialsId: 'docker-cred', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh """
                        export DOCKER_USER=\$DOCKER_USERNAME
                        export DOCKER_PASS=\$DOCKER_PASSWORD
                        docker-compose -f docker-compose.yml up -d
                        """
                    }
                }
            }
        }
    }
}

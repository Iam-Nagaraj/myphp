pipeline {
  agent any

  environment {
    DOCKER_CREDS = credentials('docker-credentials')
  }

  stages {
    stage('Run Docker Compose') {
      steps {
        script {
          try {
            sh """
              #!/bin/bash
              echo ${DOCKER_CREDS_PSW} | sudo -S /usr/bin/docker-compose up -d
            """
          } catch (Exception err) {
            echo "Error during Docker Compose execution: ${err}"
            currentBuild.result = 'FAILURE'
            error "Stopping the pipeline due to errors."
          }
        }
      }
    }
  }
}

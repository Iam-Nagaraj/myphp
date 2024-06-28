pipeline {
  agent any

  stages {
    stage('Run Docker Compose') {
      steps {
        script {
          try {
            sh '#!/bin/bash\nsudo docker-compose up -d'
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

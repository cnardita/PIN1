pipeline {
  agent any

  environment {
#   ARTIFACT_ID = "elbuo8/webapp:${env.BUILD_NUMBER}"
    NEXUS
  }
   stages {
    stage('Clonar Proyecto') {
      steps{
        git branch: 'master', url: 'https://github.com/cnardita/PIN1'
      }

    }
    stage('Crear imagen') {
      steps{
        sh '''
        docker build -t testapp .
        '''  
      }
    }
  
  
    stage('Clean Up') {
      steps{
        sh 'docker rmi '
      }
    }
  }
}

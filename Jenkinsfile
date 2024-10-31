pipeline {
  agent any
  tools {nodejs "NODEJS"} //necesario para que los test corran
  environment {
    GITHUB_REPOSITORY = "https://github.com/cnardita/PIN1"
    NEXUS_URL = "localhost:8083" 
    IMAGE_NAME = "testapp"
  }
   stages {
    stage('Clonar Proyecto') {
      steps{
        git branch: 'master', url: env.GITHUB_REPOSITORY
      }

    }
    stage('Crear imagen') {
        //Creo la imagen
        steps{
            script{
                dockerImage = docker.build("${NEXUS_URL}/${IMAGE_NAME}:${env.BUILD_ID}")               
            }
        }
    }
    stage('Run tests') {
        //Ejecuto test basicos, necesito integrar NODEJS
      steps {
        sh '''
        npm install
        npm test
        '''
      }
    }
    stage('Push to Nexus Repo') {
        steps {
            script{
                docker.withRegistry("http://${NEXUS_URL}", 'nexus-credentials'){ //tomo las credenciales administradas en jenkins
                    dockerImage.push("${env.BUILD_ID}") //pusheo a nexus con el numero de build
                }
            }
        }
    }
  }
    post{
        always{
            //Elimino las imagenes
            sh 'docker rmi ${NEXUS_URL}/${IMAGE_NAME}:${BUILD_ID}'
        }
    }
}

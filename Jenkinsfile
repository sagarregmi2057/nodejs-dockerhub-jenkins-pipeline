pipeline {
    agent any

  tools{
    nodejs 'NodeJS'
  }

    stages {
        stage('Checkout Github') {
            steps {
                git branch: 'main', credentialsId: 'jen-doc-git', url: 'https://github.com/sagarregmi2057/nodejs-dockerhub-jenkins-pipeline'
              
            }
        }

        stage('Install node dependencies') {
            steps {
             sh 'npm install'
            }
        }

        stage('Test Code') {
            steps {
              sh 'npm test'
              
            }
        }

        stage('Build Docker Image') {
            steps {
              script {
                   def img = docker.build("saga99/nodeimage:${BUILD_NUMBER}")
                   img.tag("latest")
              }
            }
        }
        stage('Push Docker Image') {
            steps {
              script {
               sh """
            echo "$DOCKERHUB_TOKEN" | docker login -u saga99 --password-stdin
            docker push saga99/nodeimage:${BUILD_NUMBER}
            docker push saga99/nodeimage:latest
            """
              }
            }
        }

      
    }

    post {
        success {
            echo 'Build completed successfully!'
        }
        failure {
            echo 'Build failed. Check logs.'
        }
    }
}

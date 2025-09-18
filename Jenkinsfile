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
                docker.build("nodeimage"+"BUILD_NUMBER")
               }

           

            }
        }

        stage('Push Docker Image') {
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

}
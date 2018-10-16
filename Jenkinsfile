pipeline {
    agent any
    stages {
        stage('SonarQube') {
            steps {
                sh 'mvn sonar:sonar'
                sh 'echo SonarQube realizado'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
                sh 'echo clean package realizado'
                sh 'docker build --tag projetodluisb .'
                sh 'echo build realizado'
            }
        }
        stage('subindo container') {
         steps {
               script{
                  try{
                   sh 'docker run -d --name teste2 -p 83:8080 projetodluisb'                   
                 } catch(exc) {
                   sh 'docker stop teste2'
                   sh 'docker rm teste2'
                   sh 'docker run -d --name teste2 -p 83:8080 projetodluisb'
                 }
            }   
          }
        }        
    }
}

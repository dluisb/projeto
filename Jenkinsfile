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
            }
        }
        stage('build') {
            steps {
                sh 'docker build --tag projetodluisb .'
                sh 'echo build realizado'
            }
        }
       stage('subindo container') {
         steps {
               script{
                 if(teste2 == true){
                   sh 'docker stop teste2'
                   sh 'docker rm teste2'
                 }else{
                   sh 'docker run -d --name teste2 -p 83:8080 projetodluisb'
                 }
            }   
          }
        }
        stage ('subindo para o dockerhub') {
            steps {
               withCredentials([string(credentialsId: 'nome', variable: 'USUARIO'), string(credentialsId: 'senha', variable: 'SENHA') ]) {
                  sh 'echo subindo para o dockerhub'
                  sh 'docker tag projetodluisb dluisb/projetodluisb'
                  sh 'docker login -u $USUARIO -p $SENHA' 
                  sh 'docker push dluisb/projetodluisb'
               }
            }
        }
     }
}

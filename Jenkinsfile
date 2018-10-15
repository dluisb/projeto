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
      stage ('Artefato Nexus'){
         steps {
               nexusArtifactUploader artifacts: [[artifactId: 'teste2', classifier: '', file: 'war/target/jenkins.war', type: 'war']], credentialsId: '3ec09dad-64e7-4856-b9a4-c1ac0199201b', groupId: 'local', nexusUrl: '127.0.0.1/nexus', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: '1.00'
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

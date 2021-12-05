pipeline {
  agent any
  stages {
    stage('checkout code ') {
      steps {
        git(url: 'https://github.com/shirinaftali/hello-world-war.git', branch: 'dev', changelog: true)
      }
    }

    stage('complie') {
      steps {
        sh '''mvn compile
mvn clean package'''
      }
    }

    stage('sonarqube') {
      steps {
        sh 'mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=shirinaftali_hello-world-war -Dsonar.login=e90e88b79b54123896066cb7ebdedb39bc6f4e7b'
      }
    }

  }
}
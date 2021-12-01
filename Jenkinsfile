pipeline {
  agent any
  stages {
    stage('checkout code ') {
      steps {
        git(url: 'https://github.com/shirinaftali/hello-world-war.git', branch: 'master', changelog: true)
      }
    }

    stage('complie') {
      steps {
        sh '''mvn compile
mvn clean package'''
      }
    }

    stage('sonarqube ') {
      steps {
        sh 'mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=hello-world-war-1.0.0'
      }
    }

  }
}
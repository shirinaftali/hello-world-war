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
        sh 'mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.login=sonar_cerd'
      }
    }

  }
    environment {
    sonar_cerd = credentials('SONAR_TOKEN')
  }
}

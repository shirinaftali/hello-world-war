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

  }
}
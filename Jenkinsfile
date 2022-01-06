pipeline {
  agent any
  

triggers {
	//Query repository weekdays every four hours starting at minute 012345
pollSCM('* * * * *')
}

  
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
        sh 'mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.login=dbee24c008ae1d5bf59f6d9762b483bbf3f15ba9'
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker build -t helloworld:$BUILD_ID .'
      }
    }

    stage('push to Nexus') {
      steps {
        withDockerRegistry(credentialsId: 'nexus_jenkins', url: 'http://127.0.0.1:8123/repository/local-docker/') {
        sh '''docker tag helloworld:$BUILD_ID 127.0.0.1:8123/repository/local-docker/helloworld:$BUILD_ID
docker push 127.0.0.1:8123/repository/local-docker/helloworld:$BUILD_ID
'''
        }
        }
    }

  }
  post {
     success {
        slackSend(message: "Build deployed successfully - ${env.JOB_NAME} #${env.BUILD_NUMBER} - (${env.BUILD_URL}) ", channel: 'int-project', color: '#008000')
     }

     failure {
          slackSend(message: " Build failed - ${env.JOB_NAME} #${env.BUILD_NUMBER} - (${env.BUILD_URL}) ", channel: 'int-project', color: '#FF0000')
     }
  }
  environment {
    sonar_cerd = credentials('SONAR_TOKEN')
  }
}

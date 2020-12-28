pipeline {
    agent {
        label 'hp-ubuntu'
    }
    environment {
      projectName: 'olresearch'
      registry: 'javarebel'
    }
    stages {
        stage('build') {
            steps {
                sh 'mvn -B clean package'
            }
        }
        stage('build-image') {
            steps {
                sh "buildah bud -t ${env.projectName}:${BUILD_NUMBER} ."
            }
        }
        stage('push-image') {
            steps {
              withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'password', usernameVariable: 'username')]) {
                  sh './jenkins/push.sh'
              }
            }
        }
    }
}
pipeline {
    agent {
        label 'hp-ubuntu'
    }
    environment {
      projectName = 'olresearch'
      registry = 'javarebel'
      DOCKER_HUB_CREDS = credentials('docker-hub')
    }
    stages {
        stage('build') {
            steps {
                sh 'mvn -B clean package'
            }
        }
        stage('build-image') {
            steps {
                // sh "buildah bud -t ${env.projectName}:${BUILD_NUMBER} ."
                sh "podman build -t ${env.projectName}:${BUILD_NUMBER} ."
            }
        }
        stage('push-image') {
            steps {
              withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'password', usernameVariable: 'username')]) {
                  sh './jenkins/push.sh'
              }
            }
        }
        stage('inspect-image') {
            steps {
              sh('skopeo inspect --creds $DOCKER_HUB_CREDS_USR:$DOCKER_HUB_CREDS_PSW docker://$registry/$projectName:latest')
            }
        }
    }
}
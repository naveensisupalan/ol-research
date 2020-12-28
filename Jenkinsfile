pipeline {
    agent {
        label 'hp-ubuntu'
    }
    stages {
        stage('build') {
            steps {
                sh 'mvn -B clean package'
            }
        }
        stage('build-image') {
            steps {
                sh 'buildah bud -t olresearch:1.1-SNAPSHOT .'
            }
        }
        stage('push-image') {
            steps {
              script {
                  podman login -u javarebel -p sound123
                  podman push olresearch:1.1-SNAPSHOT javarebel/olresearch:${BUILD_NUMBER}
                  podman push olresearch:1.1-SNAPSHOT javarebel/olresearch:latest
              }
            }
        }
    }
}
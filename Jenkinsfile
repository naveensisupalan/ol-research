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
              sh './jenkins/push.sh'
            }
        }
    }
}
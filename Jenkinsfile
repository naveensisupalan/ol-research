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
                sh 'bh bud -t olresearch:1.0-SNAPSHOT .'
            }
        }
    }
}
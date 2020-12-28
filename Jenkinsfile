pipeline {
    agent {
      node: {
        label: "hp-ubuntu"
      }
    }
    stages {
        stage('build') {
            steps {
                sh 'mvn -B clean package'
            }
        }
    }
}
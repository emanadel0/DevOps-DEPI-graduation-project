pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/emanadel0/DevOps-DEPI-graduation-project.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    docker.build('flask-app')
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image('flask-app').inside {
                        sh 'python -m unittest discover'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                ansiblePlaybook credentialsId: 'ansible-ssh-key', 
                playbook: 'playbook.yml', 
                inventory: 'hosts.ini'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful'
        }
        failure {
            echo 'Deployment failed'
        }
    }
}


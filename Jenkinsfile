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
        stage('Test') {
    steps {
        script {
            docker.image('flask-app').inside {
                sh 'python -m unittest discover -s tests'
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
    post {
    success {
        mail to: 'emansultan99@gmail.com',
             subject: "Build Successful: ${env.build-dockerized-app} #${env.BUILD_NUMBER}",
             body: "Good news, the build for ${env.build-dockerized-app} #${env.BUILD_NUMBER} was successful!"
    }
    failure {
        mail to: 'emansultan99@gmail.com',
             subject: "Build Failed: ${env.build-dockerized-app} #${env.BUILD_NUMBER}",
             body: "Oops, the build for ${env.build-dockerized-app} #${env.BUILD_NUMBER} failed."
    }
}
    post {
    success {
        slackSend (channel: 'DevOps graduation project', color: 'good', message: "Build Successful: ${env.build-dockerized-app} #${env.BUILD_NUMBER}")
    }
    failure {
        slackSend (channel: 'DevOps graduation project', color: 'danger', message: "Build Failed: ${env.build-dockerized-app} #${env.BUILD_NUMBER}")
    }
}
    stage('Push to Docker Hub') {
    steps {
        script {
            docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                def image = docker.build("emanadel911/flask-app:${env.BUILD_NUMBER}")
                image.push()
            }
        }
    }
}
    stage('Test Deployment') {
    steps {
        script {
            // Example of checking if the service is running
            def response = sh(script: 'curl -s http://your-server-ip:5000', returnStdout: true).trim()
            if (!response.contains("Hello, Dockerized World!")) {
                error("Application deployment failed")
            }
        }
    }
}
    stage('Deploy to Kubernetes') {
    steps {
        script {
            sh 'kubectl apply -f deployment.yaml'
            sh 'kubectl apply -f service.yaml'
        }
    }
}
    stage('Parallel Stages') {
    parallel {
        stage('Unit Tests') {
            steps {
                sh 'python -m unittest discover -s tests'
            }
        }
        stage('Linting') {
            steps {
                sh 'flake8 app.py'
            }
        }
    }
}
    
environment {
    DOCKER_IMAGE = 'emanadel911/flask-app'
    K8S_DEPLOYMENT = 'deployment.yaml'
    K8S_SERVICE = 'service.yaml'
}
    
stage('Integration Tests') {
            steps {
                script {
                    def response = sh(script: 'curl -s http://your-staging-server-ip:80', returnStdout: true).trim()
                    if (!response.contains("Hello, Dockerized World!")) {
                        error("Integration tests failed.")
                    }
                }
            }
        }

        stage('Deploy to Production') {
            when {
                branch 'main'
            }
            steps {
                script {
                    sh 'kubectl apply -f ${K8S_DEPLOYMENT} --record'
                    sh 'kubectl apply -f ${K8S_SERVICE} --record'
                }
            }
        }
    }
    post {
        success {
            echo 'CI/CD Pipeline completed successfully.'
        }
        failure {
            echo 'CI/CD Pipeline failed.'
        }
    }
}





}


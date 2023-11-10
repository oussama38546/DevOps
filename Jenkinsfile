pipeline {
    agent any
    triggers { 
        pollSCM('*/5 * * * *') // Vérifier toutes les 5 minutes
    }
    environment {
        // Ajouter la variable dh_cred comme variables d'authentification
        DOCKERHUB_CREDENTIALS = credentials('dh_cred')
    }
    stages {
        stage('Checkout') {
            agent any
            steps {
                checkout scm
            }
        }
        stage('Init') {
            steps {
                // Permet l'authentification
                sh "echo \${DOCKERHUB_CREDENTIALS_PSW} | sudo docker login -u \${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
            }
        }
        stage('Build') {
            steps {
                // Changer "oussama38546" avec votre username sur DockerHub
                sh 'docker build -t oussama38546/reactapp:$BUILD_ID .'
            }
        }
        stage('Deliver') {
            steps {
                // Changer "oussama38546" avec votre username sur DockerHub
                sh 'docker push oussama38546/reactapp:$BUILD_ID'
            }
        }
        stage('Cleanup') {
            steps {
                // Changer "oussama38546" avec votre username sur DockerHub
                sh 'docker rmi oussama38546/reactapp:$BUILD_ID'
                sh 'docker logout'
            }
        }
    }
}

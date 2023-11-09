pipeline {
    agent any
    environment {
        // Ajouter la variable dh_cred comme variables d'authentification
        DOCKERHUB_CREDENTIALS = credentials('dh_cred')
    }
    stages {
        stage('Checkout'){
            agent any
            steps{
                // Changer avec votre lien gitlab/github
                git branch: 'main', url:'https://github.com/oussama38546/DevOps.git'
            }
        }
        stage('Init'){
            steps{
                // Permet l'authentification
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Build'){
            steps {
                //Changer "username" avec votre username sur DockerHub
                sh 'docker build -t oussama38546/node:$BUILD_ID -f ./Dockerfile .'
            }
        }
        stage('Deliver'){
            steps {
                //Changer "username" avec votre username sur DockerHub
                sh 'docker push oussama38546/node:$BUILD_ID'
            }
        }
        stage('Cleanup'){
            steps {
            //Changer "username" avec votre username sur DockerHub
            sh 'docker rmi oussama38546/node:$BUILD_ID'
            sh 'docker logout'
            }
        }
    }
}

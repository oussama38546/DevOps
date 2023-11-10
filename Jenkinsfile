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
        script {
            // Créer un dossier de configuration Docker alternatif
            def dockerConfigDir = env.WORKSPACE + '/.docker'
            sh "mkdir -p ${dockerConfigDir}"

            // Écrire les informations d'authentification dans le fichier de configuration
            sh "echo '{\"auths\":{\"https://index.docker.io/v1/\":{\"auth\":\"${DOCKERHUB_CREDENTIALS}\"}}}' > ${dockerConfigDir}/config.json"

            // Configurer l'environnement Docker pour utiliser le dossier de configuration alternatif
            env.DOCKER_CONFIG = dockerConfigDir

            // Exécuter la commande Docker login sans sudo
            sh "docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin < ${dockerConfigDir}/config.json"
                }
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

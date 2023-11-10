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
        stage('Build and Deliver') {
            steps {
                script {
                    // Encoder les informations d'authentification en Base64
                    def dockerAuth = "${DOCKERHUB_CREDENTIALS_USR}:${DOCKERHUB_CREDENTIALS_PSW}"
                    def encodedAuth = dockerAuth.bytes.encodeBase64().toString().trim()

                    // Exécuter la commande Docker login avec l'option --password-stdin
                    sh "echo -n ${encodedAuth} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"

                    // Changer "oussama38546" avec votre username sur DockerHub
                    sh 'docker build -t oussama38546/reactapp:$BUILD_ID .'
                    sh 'docker push oussama38546/reactapp:$BUILD_ID'
                }
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

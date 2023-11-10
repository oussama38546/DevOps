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
                    // Importer la classe Base64
                    steps {
                        script {
                            script {
                                // Importer la classe Base64
                                @Grab(group='commons-codec', module='commons-codec', version='1.15')
                            }
                        }
                    }

                    // Encoder les informations d'authentification en Base64
                    def dockerAuth = "${DOCKERHUB_CREDENTIALS_USR}:${DOCKERHUB_CREDENTIALS_PSW}"
                    def encodedAuth = new String(Base64.encodeBase64(dockerAuth.bytes))

                    // Exécuter la commande Docker login avec l'option --password-stdin
                    sh "echo -n ${encodedAuth} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
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

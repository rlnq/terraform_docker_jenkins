pipeline {
    agent any
    stages {
        stage('1 - Build') {
            steps {
                echo "buildung the application..."
                sh '''
                date
                echo $BUILD_ID
                echo $JENKINS_URL
                '''
            }
        }
    }
    post {
        success {
            withCredentials([string(credentialsId: 'telegramToken', variable: 'TOKEN'), string(credentialsId: 'telegramChatId', variable: 'CHAT_ID')]) {
                telegramSend (
                    message: "Build Successful: ${env.JOB_NAME}#${env.BUILD_NUMBER}"
                )
            }
        }
    }
}

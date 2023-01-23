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
            telegramSend (
                withCredentials([string(credentialsId: 'telegramToken', variable: 'TOKEN'), string(credentialsId: 'telegramChatId', variable: 'CHAT_ID')]) {
                    botId: 'TOKEN',
                    chatId: 'CHAT_ID',
                    message: "Build Successful: ${env.JOB_NAME}#${env.BUILD_NUMBER}"
                }
            )
        }
        failure {
            telegramSend (
                withCredentials([string(credentialsId: 'telegramToken', variable: 'TOKEN'), string(credentialsId: 'telegramChatId', variable: 'CHAT_ID')]) {
                    botId: 'TOKEN',
                    chatId: 'CHAT_ID',
                    message: "Build Failed: ${env.JOB_NAME}#${env.BUILD_NUMBER}"
                }
            )
        }
    }
}

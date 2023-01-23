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
        
        stage('2 - Test') {
            steps {
                echo "testing the application..."
                sh '''
                df -h
                free -m
                '''
            }
        }
        stage('3 - Deploy') {
            steps {
                echo "deploying the application..."
            }
        }
        
        stage('Stage only for test branch') {
            when {
                expression { return env.BRANCH_NAME == 'test' }
            }
            steps {
                echo "This steps only for test stage!"
                echo "Result: SUCCESS"
            }
        } 
    }
    post {
        success {
            telegramSend (
                withCredentials([string(credentialsId: 'telegramToken', variable: 'TOKEN'), string(credentialsId: 'telegramChatId', variable: 'CHAT_ID')]) {
                    botId: 'YOUR_TOKENBOT_ID',
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


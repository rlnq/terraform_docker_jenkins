pipeline {
    agent any
    stages {
        
        stage('1-Test') {
            steps {
                echo "Start of Stage Test"
                echo "Testing......."
                echo "End of Stage Build"
                sh '''
                df -h
                free -m
                '''
            }
        }
        stage('2-Deploy') {
            steps {
                echo "Start of Stage Deploy"
                echo "Deploying......."
                echo "End of Stage Build"
            }
        }
        stage('3-examples') {
            steps {
                echo "hi"
                echo "how are you"
                echo "bb"
            }
        }
        stage('Push notification') {
            steps {
                script{
                    withCredentials([string(credentialsId: 'telegramToken', variable: 'TOKEN'), string(credentialsId: 'telegramChatId', variable: 'CHAT_ID')]) { 
                        sh '''
                        curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d parse_mode="HTML" -d text="<b>Project</b>: POC \
                        <b>Result</b>= Success"
                        '''
                    }
                }
            }
        }
    }
}

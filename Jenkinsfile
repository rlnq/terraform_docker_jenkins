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
        stage('Push notification') {
            steps {
                script{
                    withCredentials([string(credentialsId: 'telegramToken', variable: 'TOKEN'), string(credentialsId: 'telegramChatId', variable: 'CHAT_ID')]) { 
                        sh '''
                        curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d parse_mode="HTML" -d text="<b>Branch</b>:${BRANCH_NAME} - <b>Result</b>:Success"
                        '''
                    }
                }
            }
        }
    }
}

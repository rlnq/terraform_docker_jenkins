pipeline {
    agent any
    stages {
        stage('1 - Build') {
            steps {
                echo "buildung the application..."
                sh '''
                date
                echo $BUILD_ID - $BUILD_TAG
                $JENKINS_URL
                $JOB_NAME
                '''
                $JAVA_HOME
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

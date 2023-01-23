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
            // Send a push notification on success
            script {
                slackSend color: 'good', message: "Pipeline succeeded!"
            }
        }
        failure {
            // Send a push notification on failure
            script {
                slackSend color: 'danger', message: "Pipeline failed!"
            }
        }
    }
}

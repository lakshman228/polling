pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'echo building'
                sh 'cp env.example .env'
                sh 'pip3 install -r requirements.txt'
            }
        }
        stage('Test') {
            steps {
               sh 'echo testing'
               sh 'python3 manage.py test'
            }
        }

        stage('Deploy to staging') {
            steps {
                sh 'echo deploying'
                sh 'ssh deploy@192.168.2.33 -o StrictHostKeyChecking=no " bash /var/www/polling/scripts/deploy.sh "'
            }
        }

        stage('Deploy to production') {
            input {
                message "Shall we deploy to production?"
                ok "Yes please"
            }
            steps {
                sh 'echo deploying'
                sh 'ssh dare@165.22.235.232 -o StrictHostKeyChecking=no " bash /var/www/polling/scripts/deploy.sh "'
            }
        }

    }
    // apply to the whole pipeline

    post {
     // send email notification the specicied addresses if the build fails
        failure {  
             mail bcc: '', body: "<b>Failed Jenkins Build</b><br>Project: ${env.JOB_NAME} \
             <br>Build Number: ${env.BUILD_NUMBER} <br> URL of the build: ${env.BUILD_URL}", cc: '', \
             charset: 'UTF-8', from: 'jenkins@jenkins.test', mimeType: 'text/html', replyTo: 'put@youremail.com', \
             subject: "ERROR CI: Project name -> ${env.JOB_NAME}", \
             to: "notifs@henkins.test";  \
         }
    }
}
pipeline {
    agent {
        node {
            label 'docker-agent-python'
        }
    }

    stages {
        stage("Application Build"){
            steps{
                echo "Build Stage ${BUILD_ID}"
                sh """
                   git clone https://github.com/babithg/puddle-web.git
                   cd puddle-web
                   pip install -r requirements.txt
                """
            }
        }
        stage("Application Test"){
            steps{
                echo "Test Stage"
                sh """
                cd puddle-web
                python manage.py test
                """
            }
        }
        stage('Application Deliver'){
            steps{
                echo "Deliver Stage"
                sh """
                    echo "Deliver steps here !!!"
                """
            }
        }
    }
}
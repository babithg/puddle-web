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
                   cd puddle
                   pip install -r requirements.txt
                """
            }
        }
        stage("Application Test"){
            steps{
                echo "Test Stage"
                sh """
                echo "Test steps here !!!"
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
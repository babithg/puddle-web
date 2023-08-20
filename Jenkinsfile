pipeline {
    agent {
        node {
            label 'docker-agent'
        }
    }

    stages {
        stage("Application Build"){
            steps{
                echo "Build Stage"
                sh """
                    echo "Build activity steps !!!"
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
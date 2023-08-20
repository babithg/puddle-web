pipeline {
    agent {
        node {
            label 'docker-agent-python'
        }
    }

    environment {
       DOCKER_CODE = credentials('DOCKER_CODE')
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
        stage("Application Packaging"){
            steps{
                echo "Packaging Stage"
                sh """
                    cd puddle-web
                    docker build -t puddle-webapp:latest . 
                    docker login -u babithg -p${DOCKER_CODE}
                    docker tag puddle-webapp:latest babithg/puddle-webapp:latest
                    docker push babithg/puddle-webapp:latest
                    docker logout
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
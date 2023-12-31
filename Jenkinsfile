pipeline {
    agent {
        node {
            label 'docker-agent-python'
        }
    }

    environment {
        // DOCKER_USERNAME = credentials('docker-username-credentials-id')
        // DOCKER_PASSWORD = credentials('DOCKER_CODE')
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
        DOCKER_IMAGE_NAME = 'babithg/paddle-webapp:latest'
        DOCKERFILE_PATH = '/srv'
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
                // sh """
                //     cd puddle-web
                //     docker build -t puddle-webapp:latest . 
                //     docker login -u babithg -p${DOCKER_CODE}
                //     docker tag puddle-webapp:latest babithg/puddle-webapp:latest
                //     docker push babithg/puddle-webapp:latest
                //     docker logout
                // """
                script{
                    // docker.withRegistry('https://index.docker.io/v2/', DOCKER_HUB_CREDENTIALS) {
                    //     def customImage = docker.build(IMAGE_NAME, "-f ${DOCKERFILE_PATH} .")
                    //     customImage.push()
                    // }
                    def customImage = docker.build(DOCKER_IMAGE_NAME, "-f ${DOCKERFILE_PATH} .")

                    // Optionally, you can tag the image with a custom tag
                    customImage.tag('latest')

                    // Push the image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        customImage.push()
                    }
                }
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
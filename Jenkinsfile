pipeline {
    agent any

    tools {
        jdk 'JDK11'
        maven "M3"
        dockerTool '20.10.11'
            }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
//                git branch: 'main', url: 'https://github.com/spring-projects/spring-petclinic.git'
                
                // To run Maven on a Windows agent
                bat 'mvnw package'
                
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    
                    script {
                        docker.withRegistry('https://techdemo.jfrog.io/petclinic-docker-local/', 'eb48d8e6-9b8e-45af-9239-03278968fbed') {

                            def customImage = docker.build('petclinic')

                            /* Push the container to the custom Registry */
                            customImage.push()
                        }
                    }
                }
            }
        }
    }
}

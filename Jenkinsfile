pipeline {
    agent any

 

    stages {
        stage('Checkout') {
            steps {
                // Checkout the GitHub repository using credentials
                script {
                    def gitUrl = 'https://github.com/lokashp/grpctesting.git'
                    def gitBranch = 'main' // Replace with your desired branch
                    def scmVars = checkout([
                        $class: 'GitSCM',
                        branches: [[name: "*/$gitBranch"]],
                        userRemoteConfigs: [[url: gitUrl]],
                        extensions: [[$class: 'CleanCheckout']]
                    ])
                }
            }
        }

 

        stage('Run Robot Framework Test') {
            steps {
                // Navigate to the directory containing the Robot Framework test
                dir(scmVars.workspace + '/GRPC_Testing/TestCase') {
                    // Run the Robot Framework test using the 'bat' step
                    bat "robot gRPC_Testing.robot"
                }
            }
        }
    }
}

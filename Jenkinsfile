pipeline {
    agent any

 

    stages {
        stage('Checkout') {
            steps {
                // Checkout the GitHub repository
                checkout([$class: 'GitSCM',
                          branches: [[name: '*/main']], // Replace with your desired branch
                          userRemoteConfigs: [[url: 'https://github.com/lokashp/grpctesting.git']] // Replace with your GitHub repository URL
                ])
            }
        }

 

        stage('Run Robot Test') {
            steps {
                script {
                    // Navigate to the directory containing your robot test files
                    def testDirectory = "${env.WORKSPACE}/GRPC_Testing/TestCase"

                    // Change the current working directory to the test directory
                    dir(testDirectory) {
                        // Execute the BAT command to run the specific robot test
                        bat "robot gRPC_Testing.robot"
                    }
                }
            }
        }
    }
}



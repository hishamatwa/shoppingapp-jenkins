pipeline {
    agent any

    tools {
        jdk 'jdk11'
        maven 'maven3'
    }

    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {
        stage('git checkout') {
            steps {
                git branch: 'main', credentialsId: 'a3beecdd-dba7-4486-a89f-01dc38c0cb75', url: 'https://github.com/hishamatwa/shoppingapp-jenkins.git'
            }
        }

        stage('compile') {
            steps {
                sh 'mvn clean compile -Dskiptest=true'
            }
        }

        stage('owasp scan') {
            steps {
                dependencyCheck additionalArguments: '--scan ./ --format XML --format HTML', odcInstallation: 'DP'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }

        stage('sonarqube') {
            steps {
                withSonarQubeEnv('sonarqube-server') {
                    sh """
                        \$SCANNER_HOME/bin/sonar-scanner \
                        -Dsonar.projectName=Shopping-Cart \
                        -Dsonar.java.binaries=. \
                        -Dsonar.projectKey=Shopping-Cart
                    """
                }
            }
        }

        stage('build') {
            steps {
                sh 'mvn clean package -DskipTests=true'
            }
        }

        stage('docker') {
            steps {
                withDockerRegistry(credentialsId: '2ef3fa59-1073-4e74-8014-00564330eab8', url: 'https://index.docker.io/v1/') {
                    sh 'docker build -t shopping-cart -f docker/Dockerfile .'
                    sh 'docker tag shopping-cart hishamatwa/shopping-cart:latest'
                    sh 'docker push hishamatwa/shopping-cart:latest'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'docker rm -f merch-shop || true'
                    sh '''
                        docker run -d --name merch-shop \
                        --ulimit nofile=65535:65535 \
                        -p 8070:8070 \
                        -e JAVA_OPTS="-Xms128m -Xmx512m -Djava.security.egd=file:/dev/./urandom -Djava.io.tmpdir=/tmp" \
                        hishamatwa/shopping-cart:latest
                    '''
                }
            }
        }
    }
}

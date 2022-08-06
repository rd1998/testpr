pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('DOCKER_HUB_LOGIN')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t darshanrami/rdrep:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push darshanrami/rdrep:latest'
			}
		}
	}

// 	post {
// 		always {
// 			sh 'docker logout'
// 		}
// 	}

}

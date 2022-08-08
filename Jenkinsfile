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
		
		stage('File transfer into ansible server') {

			steps {
				sh 'scp /var/lib/jenkins/workspace/devassessment/* ubuntu@172.31.45.226:/home/ubuntu/project'
			}
		}
		stage('Login into ansible server and run playbook') {

			steps {
				sh """
				#!/bin/bash
				ssh ubuntu@172.31.45.226 << EOF
				cd project
				ansible-playbook ap.yml
				exit
				<< EOF
				"""
			}
		}
	}

// 	post {
// 		always {
// 			sh 'docker logout '
// 		}
// 	}

}

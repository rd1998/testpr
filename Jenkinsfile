pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('DOCKER_HUB_LOGIN')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t slkrt2211/testrepo:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push slkrt2211/testrepo:latest'
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
				ssh ubuntu@172.31.31.160 << EOF
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

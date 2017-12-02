pipeline {
  agent any
  stages {
    stage('Linting') {
      parallel {
        stage('Linting') {
          steps {
            sh 'echo \'This is a linting step\''
          }
        }
        stage('Rspec') {
          steps {
            sh 'echo \'This step runs RSpec\''
          }
        }
        stage('Docker') {
          steps {
            sh 'docker --version'
          }
        }
      }
    }
  }
}
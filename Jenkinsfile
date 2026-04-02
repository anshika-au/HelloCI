pipeline {
  agent { label 'Mac-mini-slave' }
  stages {
    stage('Git Checkout') {
      steps {
        checkout scm
      }
    }
  
    stage('Lint') {
      steps {
        sh 'fastlane lint'
      }
    }
  }
}

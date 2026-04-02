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
        sh 'bundle exec fastlane lint'
      }
    }
  }
}

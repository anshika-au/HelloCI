pipeline {
  agent { label 'Mac-mini-slave' }
  environment {
    // 1. Force the PATH to include common Mac tool locations
    PATH = "/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:${env.PATH}"
  }
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

    stage('Build') {
      steps {
        sh 'fastlane build'
      }
    }
  }
}

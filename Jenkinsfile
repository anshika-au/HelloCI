pipeline {
  agent { label 'Mac-mini-slave' }
  environment {
    PATH = "/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:${env.PATH}"
    CI = 'true' // Added this to prevent interactive prompts
  }
  stages {
    stage('Git Checkout') {
      steps {
        checkout scm
      }
    }
  
    stage('Lint') {
      steps {
        // Step into the folder where the 'fastlane' folder lives
        dir('HelloCI') {
          sh 'fastlane lint'
        }
      }
    }

    stage('Build') {
      steps {
        // Step into the folder where 'HelloCI.xcodeproj' lives
        dir('HelloCI') {
          sh 'fastlane build'
        }
      }
    }
  }
}

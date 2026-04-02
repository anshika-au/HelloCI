pipeline {
  agent { label 'Mac-mini-slave' }
  
  parameters {
    choice(
        name: 'buildVariant', 
        choices: ['Debug_Scan_Only'], 
        description: 'The variants to build'
      )
   }

  environment {
    LC_ALL = 'en_US.UTF-8'
    APP_NAME = 'HelloCI'
    BUILD_NAME = 'HelloCI'
    APP_TARGET = 'HelloCI'
    APP_PROJECT = 'HelloCI.xcodeproj'
    APP_WORKSPACE = 'project.xcworkspace'
    APP_TEST_SCHEME = 'HelloCITests'
  }

  stages {
    stage('Git Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Update Env with Build Variant') {
      steps {
        script {
          env.BUILD_VARIANT = params.buildVariant
        }
      }
    }

    stage('Git - Fetch Version/Commits') {
      steps {
        script {
          env.GIT_COMMIT_MSG = sh(returnStdout: true, script: 'git log -1 --pretty=%B ${GIT_COMMIT}').trim()
          env.DATE_TIME = sh(returnStdout: true, script: 'date +%Y.%m.%d-%H:%M:%S').trim()
        }
      }
    }

    stage('Unit Test cases') {
      steps {
        echo "Running Unit Tests..."
        // Add your test commands here, e.g., sh "xcodebuild test ..."
      }
    }

    stage('Quality checks - Report') {
      parallel {
        stage('Linting') {
          steps {
            echo "Running Linting..."
          }
        }
        stage('Code Coverage') {
          steps {
            echo "Running Code Coverage..."
          }
        }
      }
    }

    stage('Commit File changes') { 
      steps { echo "Committing changes..." } 
    }
    stage('Build') { 
      steps { echo "Building..." } 
    }
    stage('Generating Artifacts') { 
      steps { echo "Archiving..." } 
    }
    stage('Post Build -- Actions') { 
      steps { echo "Cleaning up..." } 
    }
  }

  post {
    success { echo "Build successful" }
    unstable { echo "Build unstable" }
    failure { echo "Build failed" }
    always {
        echo "Build completed with status: ${currentBuild.result}"
    }
  }
}

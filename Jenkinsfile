pipeline {
  agent { label 'mac-mini-slave' }
  parameters {
    // the default choice for commit-triggered builds is the first item in the choices list
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
   //<< Git SCM Checkout >>
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
        //Shell commands
        env.GIT_COMMIT_MSG = sh(
                                returnStdout: true, 
                                script: '''
                                  git log -1 --pretty=%B ${GIT_COMMIT}
                                 '''
                               )
        .trim()
        def DATE_TIME = sh(
                            returnStdout: true, 
                            script: '''
                                date +%Y.%m.%d-%H:%M:%S
                            '''
                          )
        .trim()
....
    }
   }
  }
  stage('Unit Test cases') {
  }
  stage('Quality checks - Report') {
     parallel {
      stage('Linting') { ... }
      stage('Code Coverage') { ... }
     }
  stage('Commit File changes') { ... }
  stage('Build') { ... }
  stage('Generating Artifacts') { ... }
  stage('Post Build -- Actions') { ... }
}
  post {
    success {
      echo "Build successful"
    }
    unstable {
       echo "Build unstable"
    }
    failure {
      echo "Build failed"
    }
    always {
        echo "Build completed with status: ${currentBuild.result}"
      }
    }
  }
}

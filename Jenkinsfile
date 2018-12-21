pipeline {
  agent any
  stages {
    stage('Clean') {
      steps {
        sh 'git checkout .'
        sh 'git clean -xfd'
      }
    }
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            sh 'pdflatex main.tex'
            sh 'bibtex main.aux'
            sh 'pdflatex main.tex'
            sh 'pdflatex main.tex'
          }
        }
        stage('Spellcheck') {
          steps {
            sh './scripts/spellcheck.sh'
          }
        }
      }
    }
    stage('Deploy') {
      // when {
      //   branch 'master'
      // }
      steps {
        sh './scripts/generate-metadata.py'
        sh './scripts/upload-whitepaper.sh'
      }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: 'main.pdf'
    }
  }
}

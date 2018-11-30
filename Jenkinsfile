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
      steps {
        sh 'pdflatex main.tex'
        sh 'bibtex main.aux'
        sh 'pdflatex main.tex'
        sh 'pdflatex main.tex'
      }
    }
  }
  post {
    success {
      archiveArtifacts artifacts: 'main.pdf'
    }
  }
}

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
            sh "find . -type f -name '*.tex' \| xargs ./scripts/spellcheck.sh"
          }
        }
      }
    }
  }
  post {
    success {
      archiveArtifacts artifacts: 'main.pdf'
    }
  }
}

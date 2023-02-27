podTemplate(yaml: '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: docker
    image: docker:dind
    securityContext:
      privileged: true
    env:
      - name: DOCKER_TLS_CERTDIR
        value: ""
''') {
  node(POD_LABEL) {
    stage('Clone repository') {
      git branch: 'main', credentialsId: 'jenkins-pet', url: 'https://github.com/val1707/web-app.git'
    }

    stage('Build') {
      container('docker') {
        sh '''VERSION=$(git log -1 --pretty=%h)
        REPO="https://github.com/val1707/web-app.git:"
        TAG="$REPO$VERSION"
        LATEST="${REPO}latest"
        BUILD_TIMESTAMP=$( date \'+%F_%H:%M:%S\' )
        docker build -t "$TAG" -t val717/webapp:"$LATEST" --build-arg VERSION="$VERSION" --build-arg BUILD_TIMESTAMP="$BUILD_TIMESTAMP" . 
        docker push "$TAG" 
        docker push "$LATEST"'''
        // dockerImage = docker.build("val717/webapp")
      }
    }
    stage ('Push to repository') {
      container('docker') {
        withDockerRegistry([ credentialsId: "docker-pass", url: "https://index.docker.io/v1/" ]) {
          dockerImage.push("${env.BUILD_NUMBER}")
        }
      }
    }
  }
}
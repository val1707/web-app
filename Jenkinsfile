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
        dockerImage = docker.build("val717/webapp")
      }
    }
    stage ('Push to repository') {
      container('docker') {
        withDockerRegistry([ credentialsId: "docker-pass", url: "https://index.docker.io/v1/" ]) {
          dockerImage.push("${env.BUILD_NUMBER}")
        }
      }
    }
    stage('Trigger ManifestUpdate') {
                echo "triggering helmupdate"
                build job: 'hemlupdate', parameters: [string(name: 'DOCKERTAG', value: "${env.BUILD_NUMBER}")]
    }
  }
}
 

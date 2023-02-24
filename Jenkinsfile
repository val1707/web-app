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
        dockerImage = docker.build("val717/k8s-app")
      }
    }
    stage ('Push to repository') {
      container('docker') {
        withDockerRegistry([ credentialsId: "docker-pass", url: "https://index.docker.io/v1/" ]) {
          dockerImage.push("${env.BUILD_NUMBER}")
        }
      }
    }

//     stage ('checkout') {
//         checkout scm
//     }
//     stage("first stage") {
//         sh 'ls -la'
//     }
//     stage("Build"){
       
       
//  sh "docker build -t wordpress:latest ."
//     }
//     stage("Check images"){
//         // sh "docker image ls"
//     }

    // stage("mysql"){
    //     fullDockerImageName ="mysql"

    //     containerID = sh(script: "docker ps --quiet --filter name=${fullDockerImageName}", returnStdout: true).trim()

    //     if(!containerID) {
    //         echo "running db container"
    //         //sh "docker container stop ${fullDockerImageName}"

    //         sh "docker container rm -f ${fullDockerImageName}"

    //         sh "docker run -it -d --name ${fullDockerImageName} -e MYSQL_DATABASE=exampledb -e MYSQL_USER=exampleuser -e MYSQL_PASSWORD=examplepass -e MYSQL_RANDOM_ROOT_PASSWORD='1' -v db:/var/lib/mysql  mysql:5.7"
        
    //     } else {
    //         echo "Container is already inplace"
    //     }
    // }

    // stage("wordpress"){

    //     wordpressDockerImageName = "wordpress"

    //     containerID = sh(script: "docker ps --quiet --filter name=${wordpressDockerImageName}", returnStdout: true).trim()

    //     if (!containerID) {

    //     echo "running wordpress container"
    //     //sh "docker container inspect 02805670e1a5"
    //     sh "docker run -it -d -p 8083:80 --name=wordpress -e WORDPRESS_DB_HOST=172.17.0.2 -e  WORDPRESS_DB_USER=exampleuser -e WORDPRESS_DB_PASSWORD=examplepass -e WORDPRESS_DB_NAME=exampledb  wordpress:latest"
        
    //  } else {
    //     sh "docker container stop ${wordpressDockerImageName}"

    //     sh "docker rm -f ${wordpressDockerImageName}"

    //     sh "docker run -it -d -p 8083:80 --name=wordpress -e WORDPRESS_DB_HOST=172.17.0.2 -e  WORDPRESS_DB_USER=exampleuser -e WORDPRESS_DB_PASSWORD=examplepass -e WORDPRESS_DB_NAME=exampledb  wordpress:latest"
    //  }
    // }


// Define your secret project token here
// def project_token = 'glpat-kvNqbTuSCABM_X7sdamH'

// // Reference the GitLab connection name from your Jenkins Global configuration (https://JENKINS_URL/configure, GitLab section)
// properties([
//     gitLabConnection('GitlabJenkins1'),
//     pipelineTriggers([
//         [
//             $class: 'GitLabPushTrigger',
//             branchFilterType: 'All',
//             triggerOnPush: true,
//             triggerOnMergeRequest: false,
//             triggerOpenMergeRequestOnPush: "never",
//             triggerOnNoteRequest: true,
//             noteRegex: "Jenkins please retry a build",
//             skipWorkInProgressMergeRequest: true,
//             secretToken: project_token,
//             ciSkip: false,
//             setBuildDescription: true,
//             addNoteOnMergeRequest: true,
//             addCiMessage: true,
//             addVoteOnMergeRequest: true,
//             acceptMergeRequestOnSuccess: false,
//             branchFilterType: "NameBasedFilter",
//             includeBranchesSpec: "release/qat",
//             excludeBranchesSpec: "",
//         ]
//     ])
// ])

    
//     stage ('Deploy to Docker') {
//     steps {
//             parallel (
//                 "instance1" : {
//                     environment {
//                         containerId = sh(script: "docker ps --quiet --filter name=${fullDockerImageName}", returnStdout: true).trim()
//                     }
//                     steps {
//                         if (containerId.isEmpty()) {
//                             docker.image('6d09fd353ce8').run("--name ${fullDockerImageName}")
//                         }
//                     }
//                 }
//             )
//         }
//    }


// stage ('Deploy to Docker') {
//     when {
//         expression {
//             return containerId.isEmpty()
//         }
//     }
//     steps {
//         parallel (
//             "instance1" : {
//                 environment {
//                     containerId = sh(script: "docker ps --quiet --filter name=${fullDockerImageName}", returnStdout: true).trim()
//                 }
//                 step {
//                     docker.image('6d09fd353ce8').run("--name ${fullDockerImageName}")
//                 }
//             }
//         )
//     }
// }

    // def imageExists = sh(script: "docker images -q wordpress:latest-test .", returnStdout: true) == 0
    // }
    // if(!imageExists){
    //     sh "docker build -t wordpress:latest-test ."
    //      } else {
    //         echo 'don't build it'
    //     }


        // }
        //if stamenent proverka dali ima sushtiq build using groovy
        //sh "docker build -t wordpress:latest-test ."
    
        // }

  }
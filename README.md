# TechDemo

Jenkinfile
https://github.com/dyslin/TechDemo/blob/main/Jenkinsfile

Dockerfile
https://github.com/dyslin/TechDemo/blob/main/Dockerfile

# Jenkin
## Create the project
Step 1:

Make sure the following tools are configured properly per the environment
- JDK11
- Git
- Maven
- Docker

Step 2:

Create a new Pipeline project

Step 3:

Select Pipeline Script from SCM
- Set SCM to Git
- Use https://github.com/dyslin/TechDemo.git as the Repoistory URL
- Use branch '*/main'
- Set everything else as default

Step 4:

Build the project

## How does it work

To simplify the setup, I chose to pull Jenkinfile from Git.  The Git repository information is defined with the project configuration.

The tools section define the tools required for this project.

The build section calls the Maven wrapper which was downloaded from Git.

If success, it will archive junit test results.

If will create then create docket image calls PetClinic and upload to JFrog repository, 

## How to load and run the docker image
Step 1: Login to jfrog artifactory, https://techdemo.jfrog.io/
- Run the command 'docker login techdemo.jfrog.io'

Step 2: Pull the docker image
- docker pull techdemo.jfrog.io/petclinic/petclinic

Step 3: Run the image
- docker run -d -p 9000:8080 techdemo.jfrog.io/petclinic/petclinic

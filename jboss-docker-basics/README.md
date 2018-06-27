# Plain Docker examples

## 0. Docker installation
Install Docker according to the official documentation that can be found here: https://docs.docker.com/engine/installation/

## 1. Docker basics
```
# Run DOCKER hello-world container
# 1. Explain pull mechanism
# 2. Highlight container output
docker run hello-world

# Show the pulled image / explain registry
docker images

# Show "hello-world" a second time (it runs damn fast now!)
docker run hello-world

# Demonstrate an interactive container based on ubuntu
docker run -it ubuntu bash
# Show that we're actually running Ubuntu on a RHEL guest
cat /etc/*-release
```

## 2. Run JBoss Enterprise Application Platform (EAP) within a Docker container

```
# Walk through Dockerfile
vi ./01-jboss-eap/Dockerfile

# Build the image
docker build --rm -t sfaulhab/jboss-eap-6.4 01-jboss-eap

# Show the image in Docker registry
docker images

# Run the container
docker run -d -p 19990:9990 -P sfaulhab/jboss-eap-6.4

# Show information about running container (get external port)
docker ps | grep sfaulhab

# Connect into running container
docker exec -ti <container-id> /bin/bash

# Open browser and login to JBoss EAP console at http://localhost:19990/

# Stop container
docker stop <container-id>

```

## 3. Run JBoss Enterprise Application Platform (EAP) incl. custom application

```
# Walk through Dockerfile
vi ./02-jboss-eap-with-app/Dockerfile

# Build the image
docker build --rm -t sfaulhab/jboss-eap-helloworld 02-jboss-eap-with-app

# Show the image in Docker registry
docker images

# Run the container
docker run -d -p 18080:8080 -P sfaulhab/jboss-eap-helloworld

# Show information about running container (get external port)
docker ps | grep sfaulhab

# Open browser and show Ticket Monster application at http://localhost:18080/ticket-monster/

# Stop container
docker stop <container-id>

```

# Red Hat OpenShift Container Platform examples

## 1. Run JBoss Enterprise Application Platform (EAP) incl. custom application on OpenShift Container Platform with S2I build strategy

Create a new project and select "Red Hat JBoss EAP 7.0 (no https)" as your S2I template. In the following screen specify the following settings:

```
Git Repository URL: https://github.com/sebastianfaulhaber/openshift-v3-showcase.git
Git Reference: <leave empty>
Context Dir: jboss-docker-basics/03-jboss-eap-on-openshift
```

Examine the OpenShift build log and wait for the according Pod come up.

Open browser and show Ticket Monster Application at http://YOUR_OPENSHIFT_HOST/ticket-monster/

## 2. Run JBoss Enterprise Application Platform (EAP) incl. custom application on OpenShift Container Platform with Docker build strategy

This example uses the official JBoss EAP Docker image (built and managed by Red Hat) which is provided through the Red Hat Container catalog (https://access.redhat.com/containers/).

```
# [OPTIONAL] Import the image into your OpenShift project (only needed if you have not imported the Red Hat xPaaS Image Streams)
oc import-image my-jboss-eap-7/jboss-eap71-openshift --from=registry.access.redhat.com/jboss-eap-7/eap71-openshift --confirm

# Create application
oc new-app https://github.com/sebastianfaulhaber/openshift-v3-showcase.git --context-dir=jboss-docker-basics/04-jboss-eap-from-container-catalog-on-openshift --strategy=docker --name=jboss-eap -l type=appserver
``` 

Examine the OpenShift build log and wait for the according Pod come up. Then create a route for the generated service by clicking on "Create Route" in the project overview. Accept all the defaults.

Open browser and show Ticket Monster Application at http://YOUR_OPENSHIFT_HOST/ticket-monster/

## 3. Run Apache httpd on OpenShift Container Platform with Docker build strategy

This example uses the official Apache httpd Docker image (built and managed by Red Hat) which is provided through the Red Hat Container catalog (https://access.redhat.com/containers/).

```
# [OPTIONAL] Import the image into your OpenShift project (only needed if you have not imported the Red Hat xPaaS Image Streams)
oc import-image my-rhscl/httpd-24-rhel7 --from=registry.access.redhat.com/rhscl/httpd-24-rhel7 --confirm

# Create application
oc new-app https://github.com/sebastianfaulhaber/openshift-v3-showcase.git --context-dir=jboss-docker-basics/05-httpd-from-container-catalog-on-openshift --strategy=docker --name=httpd -l type=webserver
``` 

Examine the OpenShift build log and wait for the according Pod come up. Then create a route for the generated service by clicking on "Create Route" in the project overview. Accept all the defaults.

Open browser and show Ticket Monster Application at http://YOUR_OPENSHIFT_HOST/
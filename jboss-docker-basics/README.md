# 0. Docker installation
Install Docker according to the official documentation that can be found here: https://docs.docker.com/engine/installation/

# 1. Docker basics
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

# 2. Run JBoss Enterprise Application Platform (EAP) within a Docker container

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


# 3. Run JBoss Enterprise Application Platform (EAP) incl. custom application

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

# 4. Run JBoss Enterprise Application Platform (EAP) incl. custom application on OpenShift Container Platform

Create a new project and select "Red Hat JBoss EAP 7.0 (no https)" as your S2I template. In the following screen specify the following settings:

```
Git Repository URL: https://github.com/sebastianfaulhaber/openshift-v3-showcase.git
Git Reference: <leave empty>
Context Dir: jboss-docker-basics/03-jboss-eap-on-openshift
```

Examine the OpenShift build log and wait for the according Pod come up.

Open browser and show Ticket Monster Application at http://YOUR_OPENSHIFT_HOST/ticket-monster/


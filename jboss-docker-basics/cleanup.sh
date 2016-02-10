#!/bin/bash
# Cleanup old images
docker rmi -f docker.io/hello-world
docker rmi -f sfaulhab/jboss-eap-6.4
docker rmi -f sfaulhab/jboss-eap-helloworld

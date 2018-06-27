### Use the official base image from Red Hat Container Catalog
FROM eap71-openshift

### File Author / Maintainer
LABEL maintainer="sebastian.faulhaber@redhat.com"

### Add application to JBoss EAP
COPY app/ticket-monster.war $JBOSS_HOME/standalone/deployments/

# openshift-v3-showcase
Demonstration projects that showcase Red Hat OpenShift Enterprise V3 (https://enterprise.openshift.com/).


## Prerequisites

1. Enable Images to Run with USER in the Dockerfile (see https://docs.openshift.com/enterprise/3.1/admin_guide/manage_scc.html#enable-images-to-run-with-user-in-the-dockerfile)

oc edit scc restricted
# Change the runAsUser.Type strategy to RunAsAny



# APPENDIX
- IBM WebSphere Application Server for Developers Liberty Profile documentation: https://hub.docker.com/_/websphere-liberty/

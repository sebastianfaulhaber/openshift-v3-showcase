
# Prerequisites
You will have to install the following prerequisites:

1. Ansible V2.4
2. OpenShift Command Line Tools

# Installation on OpenShift Container Platform

## 1. Create OpenShift resources
```
# Before running the playbook, you will have to login
oc login <YOUR_OPENSHIFT_MASTER_URL> --token=<hidden>
ansible-playbook 01-create-site.yml
```

## 2. DNS configuration
Create the following name server entries:
```
www.openshift-anwender.de   CNAME   <OCP_ROUTE_HOSTNAME>
```
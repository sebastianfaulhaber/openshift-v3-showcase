
# Prerequisites
You will have to install the following prerequisites in order to use the playbook:

1. Ansible V2.4
2. OpenShift Command Line Tools
3. PHP


# Installation on OpenShift Container Platform
```
# Before running the playbook, you will have to login
oc login <YOUR_OPENSHIFT_MASTER_URL> --token=<hidden>
ansible-playbook create-wordpress.yml
```
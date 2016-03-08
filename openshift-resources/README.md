# Limiting resource consumption for users

## A. Resource limits
Resource limits allow you to set boundaries (max/min & default) for the compute resources a developer can define on pod/container level (see  https://docs.openshift.com/enterprise/3.1/dev_guide/compute_resources.html).

1. Login to OpenShift with an admin user
2. Change to target project with
```
oc project <my-project>
```
3. Import limit range (see https://docs.openshift.com/enterprise/3.1/dev_guide/limits.html on what options are available)
```
oc create -f limit-range.json
```
4. Browse to OpenShift admin console, select the project and then "Settings".

## B. Quotas
A quota allows you to set hard limits on the overall resource consumption on project level. This is in particular useful to create a t-shirt size based accounting model (small, medium, large) for OpenShift. See also https://docs.openshift.com/enterprise/3.1/dev_guide/quota.html.

1. Login to OpenShift with an admin user
2. Change to target project with
```
oc project <my-project>
```
3. Create quota for project:
```
oc create -f resource-quota.json
```
4. Browse to OpenShift admin console, select the project and then "Settings".

# Integrating persistent storage

## Creating a persistent volume for NFS storage plugin
The administrator is responsible for creating volumes (PV). The administrator assigns some external thing (partition, entire device, NFS volume, whatever) to a PV.

1. Login to OpenShift with an admin user
2. Create persistent volume:
```
oc create -f persistent-volume-nfs.yaml
```
3. Check status of persistent volume:
```
oc get pv
```

## Creating a persistent volume claim
The end-user/developer/user/whatever is responsible for making a request for a volume (PVC). They get assigned some volume, and they don't really know what it is. Keep in mind that there is a 1:1 mapping between PV and PVCs.

1. Login to OpenShift
2. Create persistent volume claim:
```
oc create -f persistent-volume-claim.yaml
```

IBM WebSphere Application Server Liberty Core on OpenShift V3 Handbook
======================================================================

A. Synopsis
===========

What this is about
------------------
This project demonstrates how to use IBM WebSphere Liberty (a lightweight Java EE container comparable with Apache Tomcat) on Red Hat's leading  Platform-as-a-Service (PaaS) solution OpenShift Enterprise V3 (https://enterprise.openshift.com/). Since OpenShift is perfectly suited for running containerized workloads based on the Docker format, we could reuse the officially supported image built by IBM. Additionally we've added OpenShifts powerful templating mechanism in order to create a superior developer experience:

* Self-service based provisioning of new IBM WebSphere Application Server Liberty Core containers
* Existing, not yet containerized applications can simply be reused
* No prior experience with Docker needed
* Automated build & deploy life cycle

The source code can be found here: https://github.com/sebastianfaulhaber/openshift-v3-showcase/tree/master/websphere-liberty

Screenshots
------------------
![1. Select WebSphere Liberty template](./doc/01_select_template.png)

![2. Provide details on application](./doc/02_fill_out_template_details.png)

![3. Application artifacts successfully created](./doc/03_template_creation_result.png)

![4. OpenShift automatically builds initial Docker image for application](./doc/04_build_running.png)

![5. Build and deployment completed successfully](./doc/05_build_and_deployment_finished.png)

![6. IBM WebSphere Liberty startup screen](./doc/06_liberty_splashscreen.png)

B. Installation
===============

1. Setup OSE Environment
------------------------
There are multiple ways to spin up a new OpenShift environment:

#### All-In-One VM
This community provided Vagrant box probably provides the most convenient and fastest way to start your OpenShift developer experience. It features a complete OpenShift installation within one VM that allows you to test all aspects of a container application platform.

See for detailed instructions: http://www.openshift.org/vm/

#### On premise installation
The instructions for setting up an on premise installation of OpenShift Enterprise V3 can be found here: https://docs.openshift.com/enterprise/3.1/install_config/install/index.html.

#### OpenShift Dedicated
OpenShift Dedicated is a new offering from OpenShift Online. OpenShift Dedicated offers a hosted OpenShift 3 environment to run the containers powering your applications. This offering provides an isolated instance hosted on Amazon Web Services (AWS), providing increased security and management by the OpenShift operations team, so that you have peace of mind about the stability and availability of the platform.

See https://www.openshift.com/dedicated/

2. Enable OpenShift to run Docker images with USER in the Dockerfile
--------------------------------------------------------------------
The currently provided version of IBM's WebSphere Liberty Docker image requires the use of USER in the Dockerfile. Due to the security implications raised by USER statements OpenShift restricts the use by default. In order to make this project work, you will need to relax the security settings as described here: https://docs.openshift.com/enterprise/3.1/admin_guide/manage_scc.html#enable-images-to-run-with-user-in-the-dockerfile.

```
# Login to your OpenShift master via SSH
su -
oc edit scc restricted
# Change the runAsUser.Type strategy to RunAsAny
```

3. Import template into your OpenShift environment
--------------------------------------------------
```
wget https://raw.githubusercontent.com/sebastianfaulhaber/openshift-v3-showcase/master/websphere-liberty/websphere-liberty-template.json
oc create -f websphere-liberty-template.json -n openshift
```

4. Enable build & deployment automation [OPTIONAL]
---------------------------------------
TBD - Show how to automate the build&deploy lifecycle via webhooks

C. Reference Information
========================

WebSphere specific
------------------
* IBM WebSphere Application Server for Developers Liberty Profile documentation - https://hub.docker.com/_/websphere-liberty/
* Getting started with Liberty for Developers -  http://www.redbooks.ibm.com/abstracts/sg248076.html?Open
* Supported Software & Hardware -  http://www-01.ibm.com/support/docview.wss?uid=swg27038218

OpenShift specific
------------------
* Red Hat OpenShift Enterprise documentation -  https://docs.openshift.com/enterprise/3.1/welcome/index.html


# Setup Project
```
oc delete project demo-project-01
oc new-project demo-project-01
```

# Setup Build Environment (Build Config + Image Stream)

```
oc create -f build_config_httpd.yaml && oc create -f build_config_jboss-eap.yaml
```

# Setup deployments for latest version of the app (Deployment Config + Service Config + Route)
```
oc create -f deployment_config_app_latest.yaml
```


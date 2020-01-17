# Helm Kubectl Docker

# Build the version yo need
Build whatever the version of matrix kubectl/helm you need. Just change the versions you need to compile in file `.github/workflows/dockerimage.yml`:
```yaml
jobs:
  build:
    strategy:
      matrix:
        kubectl_version:
          - v1.16.8
          - v1.16.7
        helm_version:
          - v3.0.2
          - v3.0.1
```
A docker image will be automatically generated when build succeed.

## Dockerhub
Link to Dockerhub : [https://hub.docker.com/r/germainlefebvre4/helm-kubectl-docker](https://hub.docker.com/r/germainlefebvre4/helm-kubectl-docker)

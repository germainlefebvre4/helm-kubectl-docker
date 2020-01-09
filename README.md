# Helm Kubectl Docker

# Build the version yo need
Build whatever the version of matrix kubectl/helm you need:
```bash
# Git aliases
alias gitb='git branch'
alias gitc='git checkout'
alias gitf='git fetch'
alias gitfa='git fetch --all'
alias gitp='git pull'
alias gitpm='git pull origin master'
alias gits='git status'
```
alias
```bash
# Here we build
#   Kubectl versions 1.14.0 to 1.14.10
#   Helm versions 2.15.0 to 2.15.1
for i in v1.14.{0..10} ; do
    for j in v2.15.{0..1} ; do
        gitc master
        #gitb -D $i-$j
	#git push -d origin $i-$j
        gitc -b $i-$j
        sed -i "s/\(KUBE_VERSION=\).*/\1$i/g" Dockerfile
        sed -i "s/\(HELM_VERSION=\).*/\1$j/g" Dockerfile
        git add Dockerfile
        git commit -m "feat: Kubectl $i Helm $j"
        git push origin $i-$j
    done
done
```
A docker image will be automatically generated when build succeed.

## Dockerhub
Link to Dockerhub : [https://hub.docker.com/r/germainlefebvre4/helm-kubectl-docker](https://hub.docker.com/r/germainlefebvre4/helm-kubectl-docker)

# Golang-Microservice.
```A simple microservice written in Go with sweetness of Docker Containers & Kubernetes Orchestration.```

#### 1. Creating a simple go microservice.
```
 $ go mod init Golang-Microservice
 $ go build
```
Output is binary file `Golang-Microservice`

#### 2. Containerizing Go Microservice on Docker.
Building docker image with Dockerfile:
```
$ docker build -t ducnv95/golang-microservice:1.0 .
```
Pushing the docker image on docker-hub:
```
$ docker login
$ docker push ducnv95/golang-microservice:1.0 
```
#### 3. Deploying & Scaling Go microservice on __Kubernetes__.
Create pod:
```
# kubectl create -f k8s-pods.yml
```
Create deployment:
```
# kubectl create -f k8s-deployment.yml
```
Create service:
```
# kubectl create -f k8s-service.yml
```
Verify
```
# curl $(minikube service golang-microservice --url)/people
```
Roll-up, roll-back a deployment
```
# kubectl set image deployment.extensions/golang-microservice golang-microservice=ducnv95/golang-microservice:2.0 --record=true
# kubectl get pod,deploy,svc,rs -o wide
# kubectl describe deployment
# kubectl rollout history deployment.extensions/golang-microservice
# kubectl rollout undo deployment.extensions/golang-microservice --to-revision=1
```
Scaling a deployment
```
# kubectl scale deployment golang-microservice --replicas=4
```
Delete all
```
# kubectl delete all -l app=golang-microservice
```

## Happy Learning!
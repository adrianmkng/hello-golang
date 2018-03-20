# GOLANG Hello world

## Prerequisites

- Golang
- Docker
- Minikube

To run completely offline you will need to start a local registry
```bash
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

## Usage

To build the project artifacts simply run:
```bash
./build.sh
```

This will 
1. Create the `hello-golang` binary
2. Create the `hello-golang` docker image

Once the image is build you can deploy the images to kubernetes:
```bash
kubectl apply -f service.yml
kubectl apply -f deploymemt.yml
```

Now that the application is running in kubernetes you will need to lookup the mimikube ip address and the service port to reach the application.

```
> minikube ip
192.168.99.100

> kubectl get svc hello-golang
NAME           TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
hello-golang   LoadBalancer   10.97.89.193   <pending>     80:30741/TCP   27m
```

The second port under PORT(S) will be the node port the service is exposed on so in this example you will be able to reach the application from 192.168.99.100:30741/hello

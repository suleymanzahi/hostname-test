# hostname 


### Build Docker image

To build a new image, run:

```bash
docker build -t <REGISTRY>/hostname:<VERSION> .
```

If you wish to push to the container registry at the same, add `--push` to above command. Otherwise, run when image is ready to push:

```bash
docker push <REGISTRY>/hostname:<VERSION>
```

### Deploy app to Kubernetes cluster

Ensure that a Kubernetes cluster is up and running. Quick check:

```bash
kubectl get nodes
```

This should list the server and worker nodes.

To deploy the app, run:

```bash
kubectl apply -f k8s/
```

This will deploy the Deployment, Service, Ingress and HorizontalPodAutoscaler objects.

To teardown and delete all objects, run:

```bash
kubectl delete all --all 
```

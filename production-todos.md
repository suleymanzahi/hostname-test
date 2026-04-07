# TODOs towards production quality

### Containers
- I would use a smaller or hardened minimal image, such as Docker Hardened Image or distroless images from Google. They reduce attack surfaces by making the images much smaller: The downside is that they become harder to debug, so it would require proper logging or other tools.

- Use a tool to scan code and images for vulnerabilities

- I would experiment with more secure container runtimes such as gVisor. It forbids many syscalls and has stricter policies, so it would be interesting to check out. Downside is that it may slow down the application, so it would have to be investigated. 

- Implement HTTPS and TLS

- Implement logging, with projecs such as Grafana, Prometheus

- Implement dedicated endpoints for live and readiness probes in the code such /healthz and /live

### CI/CD

- Add a CI/CD pipeline, which on a PR would automatically runs all tests, create new image and push it to registry, and make it so that the cluster pulls the new image and rolls out update.

### k8s

- Run it on a 'real' cluster :smile:

- I would helmify the application, it makes it easier to distribute and deploy, and you can more easily configure different values for k8s objects for different environments.

- I used Ingress in this project, but Gateway API is the new API and may be worth considering since on the surface it looks it can simplify handling of incoming requests.

- Implement Pod Security Standards at cluster/namespace level

- To secure the app further, NetworkPolicies would be required, so that unwanted network communication is denied. For example, the Pods should only be able to send back requests and communicate with appropiate endpoints in the cluster, and not send traffic to anything outside the cluster. It makes it more defense in depth.

- Pod anti-affinity to make sure that multiple containers aren't scheduled on one Pod, in case it goes down.

- Improve HPA, first profile code and add relevant metrics, as well add scale down when load decreases

- Vertical Pod Autoscaling would be interesting since we can resize CPU and memory, instead of spinning up new Pods.






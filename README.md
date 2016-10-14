# minecraft-server

Initialized artifacts with:

```console
$ kubectl run minecraft-server --image=itzg/minecraft-server \ 
>                              --port=25565 --env="EULA=true" \
>                              --dry-run -o yaml > minecraft-server-deployment.yaml
```

```console
$ kubectl expose deployment minecraft-server --type=LoadBalancer \
>                                            --dry-run -o yaml > minecraft-server-service.yaml


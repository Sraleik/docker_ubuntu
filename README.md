# ubuntu with some préinstall stuff

## Lauch simple version

```
docker run -d --name ubuntu_test registry.gitlab.com/sraleik/docker_ubuntu:16.04-simple
docker exec -it ubuntu_test /bin/bash
```

## Lauch dev version

```
docker run -d --name ubuntu_test registry.gitlab.com/sraleik/docker_ubuntu:16.04-dev
docker exec -it ubuntu_test /bin/bash
```

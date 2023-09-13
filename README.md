# Docker and Podman

- Docker templates for various courses to use with Docker or Podman Container
- run.sh and run-jupyter.sh scripts defaults to docker container
- you can explictly provide --podman argument to run podman container

```bash
$ bash run.sh --podmman
$ bash run-jupyter.sh --podman
```

- Make sure to copy the files into a folder with all lowercase names beacuse the run.sh and run-jupyter.sh scripts use the parent folder name as the container name

## Install following tools

1. Doker Desktop - [https://www.docker.com/products/docker-desktop/](https://www.docker.com/products/docker-desktop/)
2. OR - Podman Desktop: [https://podman-desktop.io/downloads/](https://podman-desktop.io/downloads)
  - follow instructions from here: [https://podman-desktop.io/docs/intro](https://podman-desktop.io/docs/intro)

### Windows system

1. Install git along with git-bash: [https://git-scm.com/download/win](https://git-scm.com/download/win)
2. Follow instruction here to install Docker - [https://docs.docker.com/desktop/install/windows-install/](https://docs.docker.com/desktop/install/windows-install/)


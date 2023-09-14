# MongoDB Docker Container

## Initial Setup

- create a folder say mongodb somewhere you desire
- Copy Dockerfile and run.sh files from this folder into the mongodb folder
- create data folder to store all the mongodb databases

```bash
  mongodb/data
```

- Check if the docker-mongodb container is running

```bash
$ docker ps
```

## Run MongoDB server

- Open terminal change working directory to mongodb that contains Dockerfile and run.sh script
- Run run.sh script (use git-bash terminal on Windows)

```bash
$ cd /Users/rbasnet/mongodb
$ bash run.sh
```
## Stop mongodb server container

```bash
$ docker stop [id]
```

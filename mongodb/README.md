# MongoDB Docker Container

## Initial Setup

- Create a folder path such as: mongodb/data
  - e.g. Users/rbasnet/mongodb/data
- Copy Dockerfile and run.sh files into mongodb folder
- Using terminal run run.sh script
  - use git-bash on windows

  ```bash
  $ bash run.sh
  ```
- Check if the my_mongodb container is running
  ```bash
  $ docker ps
  $ docker ps -a
  ```

## Stop and remove mongodb server container

```bash
$ docker stop my_mongodb
$ docker rm my_mongodb
```

## Run MongoDB server

- Open terminal change working directory to mongodb
- Run run.sh script (use git-bash terminal on Windows)

```bash
$ cd /Users/rbasnet/mongodb
$ bash run.sh
```

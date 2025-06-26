# Cockpit Headless CMS Docker

Run [cockpit CMS](https://getcockpit.com/) locally inside a [docker](https://www.docker.com/) container. The data persistance can be a mounted folder on the host machine or a docker volume.

# Start

```shell
docker compose up
```

# Backup Docker Volume

If you use a docker volume for storage you can use one of the scripts below to either create a `.tar.gz` backup archive or folder with the backup data.

```shell
docker run --rm \
  -v headless-cms_cockpit-data:/volume \
  -v $(pwd):/backup \
  busybox \
  tar czf /backup/backup.tar.gz -C /volume .
```

```shell
docker run --name temp-container -v headless-cms_cockpit-data:/data busybox ; \
docker cp temp-container:/data "./storage(backup)" ; \
docker rm temp-container
```

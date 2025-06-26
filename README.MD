# Cockpit Headless CMS (Docker)

Run cockpit CMS locally inside a docker container. the persistent storage is your local machine. this setup can be used to develop static sites locally with a headless CMS.

# Start

```shell
docker compose up
```

# Deploy

If you want to deploy a copy the `storage` folder to your deployment


# Data Backup

docker run --rm \
  -v headless-cms_cockpit-data:/volume \
  -v $(pwd):/backup \
  busybox \
  tar czf /backup/backup.tar.gz -C /volume .


docker run --name temp-container -v headless-cms_cockpit-data:/data busybox ; \
docker cp temp-container:/data ./backup ; \
docker rm temp-container

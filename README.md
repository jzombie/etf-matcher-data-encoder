## Generate new Encryption Keys

```bash
docker compose build --no-cache
```

_Note: `{project_root}/out/.env` won't be updated until running `docker compose up`._

## Encode

```bash
docker compose up      # or `docker compose up encode`
```

Ensure `{project_root}/out/.env` is synced w/ project.

Note: `{project_root}/.env` is ignored when building the project but can be used for encoding. A new `{project_root}/out/.env` will not be created, so keep this in mind.

## Wipe

```bash
docker compose up wipe
```

## Container Bash

```bash
docker-compose run -it bash
```

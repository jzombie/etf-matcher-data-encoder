## Generate new Encryption Keys

```bash
docker compose build --no-cache
```

_Note: `out/.env` won't be updated until running `docker compose up`._

## Encode

```bash
docker compose up      # or `docker compose up encode`
```

Ensure .env is synced w/ project.

## Wipe

```bash
docker compose up wipe
```

## Container Bash

```bash
docker-compose run -it bash
```

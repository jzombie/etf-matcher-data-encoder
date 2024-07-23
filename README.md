## Generate new Encryption Keys

```bash
docker compose build --no-cache
```

## Encode

```bash
docker compose up      # or `docker compose up encode`
```

Ensure .env is synced.  
_Note: `out/.env` won't be updated until running `docker compose up`._

## Wipe

```bash
docker compose up wipe
```

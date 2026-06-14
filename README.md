# PHIDIE CRM

This repository is a server snapshot and redeploy baseline for the PHIDIE CRM project derived from EspoCRM.

## Current Server Snapshot

- Source server: `101.34.32.164`
- Runtime project directory: `/opt/espocrm`
- Application volume: `espocrm_espocrm-data`
- Database volume: `espocrm_espocrm-db-data`
- Public site directory snapshot: `site/`
- Snapshot date: `2026-06-14`

## Repository Layout

- `deploy/` - Docker Compose deployment files.
- `app/` - EspoCRM application volume snapshot, excluding cache, tmp and logs.
- `site/` - Thin website entry directory from `/www/wwwroot/crm.phidie.cn`.
- `database/` - MySQL dump snapshot for migration/restoration.

Production secrets are intentionally not committed. Use `deploy/.env.example` as the template for a real `deploy/.env`.

## Deploy To A New Server

1. Install Docker and Docker Compose.
2. Copy `deploy/.env.example` to `deploy/.env` and set strong passwords and the target site URL.
3. Start MySQL and EspoCRM:

```bash
cd deploy
docker compose --env-file .env up -d
```

4. Restore the database if you need the current snapshot content:

```bash
gzip -dc ../database/espocrm-db-20260614.sql.gz | docker exec -i espocrm-db mysql -uespocrm -p espocrm
```

5. Restore the app snapshot into the EspoCRM volume if the target environment needs the current customized files:

```bash
docker cp ../app/. espocrm-app:/var/www/html/
docker exec espocrm-app chown -R www-data:www-data /var/www/html/data /var/www/html/custom /var/www/html/client/custom
```

6. Create `app/data/config-internal.php` on the target from `app/data/config-internal.example.php`, then set the real DB password and generated instance secrets.

## Development Direction

The next development phase should remove remaining EspoCRM branding and build the intended intelligent customer-management workflow:

- Website inquiries, customer emails and support messages enter one CRM.
- The system classifies customer type, demand stage and next action.
- Enterprise knowledge base content is used to generate reviewable reply suggestions.

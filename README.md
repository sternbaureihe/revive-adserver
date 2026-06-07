# Revive Adserver

Docker image for Revive Adserver 5.5.2 — SternBaureihe ad infrastructure.

- **Image:** `ghcr.io/sternbaureihe/revive-adserver:latest`
- **PHP:** 8.1
- **Web server:** nginx
- **Base:** Alpine Linux
- **Revive version:** 5.5.2

Built from official Revive Adserver GitHub release. No third-party base images.

## First-time setup

After deploy, complete the web installer at `https://ads.audacitiesadvertising.com`

Database settings:
- Host: `db`
- User: `revive`
- Database: `revive`

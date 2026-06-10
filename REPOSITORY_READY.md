# Repository Ready

## Repository Name Recommendation

`food-delivery-marketplace`

Alternative names:

- `delivery-marketplace-platform`
- `multi-vendor-food-delivery`
- `restaurant-delivery-platform`

## GitHub Repository Description

Commercial multi-vendor food delivery marketplace with Laravel API, Flutter customer/driver/restaurant apps, React admin dashboard, PostgreSQL, Redis, Reverb, and Docker deployment.

## Topics / Tags

- food-delivery
- marketplace
- laravel
- laravel-12
- flutter
- riverpod
- go-router
- postgresql
- redis
- sanctum
- spatie-permission
- reverb
- docker
- admin-dashboard
- multi-vendor
- restaurant-management
- delivery-tracking

## Branch Strategy

- `main`: production-ready code only
- `develop`: shared integration branch
- `feature/*`: feature development
- `fix/*`: bug fixes
- `release/*`: release candidates
- `hotfix/*`: urgent production fixes

Recommended protection rules:

- Require pull requests into `main`
- Require status checks
- Require at least one reviewer
- Block force pushes
- Require linear history if the team prefers clean releases

## Deployment Summary

Production deployment uses:

- Laravel 12 API
- PostgreSQL with PostGIS
- Redis for cache, sessions, queues, and real-time state
- Laravel queue workers
- Laravel Reverb for real-time events
- Nginx reverse proxy
- Docker Compose for service orchestration

Deployment entry points:

- `infrastructure/docker-compose.yml`
- `infrastructure/nginx/default.conf`
- `DEPLOYMENT_GUIDE.md`

## Repository Cleanup Summary

The GitHub-ready repository excludes:

- ZIP archives
- Temporary generator scripts
- Previous phase output markdown
- Old status reports that are not needed by the team
- Local build/cache folders

The repository keeps:

- Source code
- Tests
- Infrastructure files
- Setup documentation
- Contribution guidelines
- MIT license

# Development Setup

## Recommended Workflow

- Use `main` for stable production-ready code.
- Use `develop` for integration.
- Create feature branches from `develop`.
- Open pull requests into `develop`.
- Release branches merge into `main`.

## Backend Commands

```bash
cd backend
composer install
php artisan test
php artisan migrate:fresh --seed
php artisan queue:work
php artisan reverb:start
```

## Flutter Commands

```bash
cd apps/customer_app
flutter pub get
flutter analyze
flutter test
```

Repeat the same workflow for:

```bash
apps/driver_app
apps/restaurant_app
```

## Admin Dashboard Commands

```bash
cd apps/admin_dashboard
npm install
npm run build
npm run test
```

## Environment Variables

### Backend

| Variable | Description |
|---|---|
| `APP_NAME` | Laravel application name |
| `APP_ENV` | `local`, `staging`, or `production` |
| `APP_KEY` | Laravel encryption key |
| `APP_DEBUG` | Debug mode |
| `APP_URL` | Public API/backend URL |
| `DB_CONNECTION` | Should be `pgsql` |
| `DB_HOST` | PostgreSQL host |
| `DB_PORT` | PostgreSQL port |
| `DB_DATABASE` | PostgreSQL database name |
| `DB_USERNAME` | PostgreSQL username |
| `DB_PASSWORD` | PostgreSQL password |
| `CACHE_STORE` | Redis cache store |
| `QUEUE_CONNECTION` | Redis queue connection |
| `SESSION_DRIVER` | Redis session driver |
| `REDIS_HOST` | Redis host |
| `REDIS_PORT` | Redis port |
| `BROADCAST_CONNECTION` | Should be `reverb` |
| `REVERB_APP_ID` | Reverb app id |
| `REVERB_APP_KEY` | Reverb app key |
| `REVERB_APP_SECRET` | Reverb app secret |
| `REVERB_HOST` | Reverb host |
| `REVERB_PORT` | Reverb port |
| `REVERB_SCHEME` | `http` or `https` |

### Flutter Apps

| Variable | Description |
|---|---|
| `API_BASE_URL` | Backend API base URL, for example `https://api.example.com/api` |

Run with:

```bash
flutter run --dart-define=API_BASE_URL=http://localhost:8000/api
```

### Admin Dashboard

| Variable | Description |
|---|---|
| `VITE_API_BASE_URL` | Backend API base URL |

## Quality Checks

Before opening a pull request:

```bash
cd backend && php artisan test
cd apps/customer_app && flutter analyze && flutter test
cd apps/admin_dashboard && npm run build
```

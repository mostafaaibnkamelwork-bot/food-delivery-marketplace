# Environment Variables

## Backend `.env`

Copy:

```bash
cp backend/.env.example backend/.env
```

Important variables:

```env
APP_NAME="Food Delivery Marketplace"
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=http://localhost

DB_CONNECTION=pgsql
DB_HOST=postgres
DB_PORT=5432
DB_DATABASE=marketplace
DB_USERNAME=marketplace
DB_PASSWORD=marketplace

CACHE_STORE=redis
QUEUE_CONNECTION=redis
SESSION_DRIVER=redis

REDIS_CLIENT=predis
REDIS_HOST=redis
REDIS_PORT=6379

BROADCAST_CONNECTION=reverb
REVERB_APP_ID=marketplace
REVERB_APP_KEY=local
REVERB_APP_SECRET=secret
REVERB_HOST=localhost
REVERB_PORT=8080
REVERB_SCHEME=http
```

## Flutter

Pass API base URL at runtime:

```bash
flutter run --dart-define=API_BASE_URL=http://localhost:8000/api
```

## Admin Dashboard

Use:

```env
VITE_API_BASE_URL=http://localhost:8000/api
```

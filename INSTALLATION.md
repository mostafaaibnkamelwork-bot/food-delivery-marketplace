# Installation

## Prerequisites

Install:

- PHP 8.3+
- Composer 2+
- PostgreSQL 16+ with PostGIS
- Redis 7+
- Flutter latest stable
- Node.js 20+
- Docker and Docker Compose

## Backend Installation

```bash
cd backend
cp .env.example .env
composer install
php artisan key:generate
php artisan migrate --seed
php artisan storage:link
php artisan serve
```

## Queue Worker

```bash
cd backend
php artisan queue:work --tries=3
```

## Reverb

```bash
cd backend
php artisan reverb:start
```

## Customer App

```bash
cd apps/customer_app
flutter pub get
flutter run --dart-define=API_BASE_URL=http://localhost:8000/api
```

## Driver App

```bash
cd apps/driver_app
flutter pub get
flutter run --dart-define=API_BASE_URL=http://localhost:8000/api
```

## Restaurant App

```bash
cd apps/restaurant_app
flutter pub get
flutter run --dart-define=API_BASE_URL=http://localhost:8000/api
```

## Admin Dashboard

```bash
cd apps/admin_dashboard
npm install
npm run dev
```

## Docker Installation

```bash
docker compose -f infrastructure/docker-compose.yml up -d --build
```

Then run backend setup commands inside the app container:

```bash
php artisan key:generate
php artisan migrate --seed
```

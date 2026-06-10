# Food Delivery Marketplace

A commercial food delivery marketplace platform inspired by Talabat and HungerStation. The repository is organized as a multi-application product with a Laravel API backend, Flutter mobile apps, an admin dashboard, and production deployment infrastructure.

## Repository Description

This project provides the foundation for a multi-sided food delivery marketplace:

- Customers browse restaurants, manage carts, place orders, track deliveries, use coupons, write reviews, and open support tickets.
- Drivers manage availability, assigned orders, pickup, delivery, tracking, earnings, wallet, and support.
- Restaurants manage branches, menus, products, orders, employees, reports, coupons, and settings.
- Admins manage the platform, users, restaurants, drivers, orders, payments, commissions, settlements, reports, support, and system settings.

## Tech Stack

- Backend: Laravel 12, PostgreSQL, Redis, Laravel Sanctum, Spatie Permission, Laravel Reverb
- Customer App: Flutter, Riverpod, Go Router, Dio, Material 3
- Driver App: Flutter, Riverpod, Go Router, Dio
- Restaurant App: Flutter, Riverpod, Go Router, Dio
- Admin Dashboard: React, TypeScript, Vite
- Infrastructure: Docker, Nginx, PostgreSQL/PostGIS, Redis, queue workers, Reverb

## Top-Level Structure

```text
.
├── backend/
├── apps/
│   ├── customer_app/
│   ├── driver_app/
│   ├── restaurant_app/
│   └── admin_dashboard/
├── infrastructure/
├── docs/
├── README.md
├── INSTALLATION.md
├── DEVELOPMENT_SETUP.md
├── PROJECT_STRUCTURE.md
├── CONTRIBUTING.md
├── LICENSE
└── REPOSITORY_READY.md
```

## Quick Start

Read these documents in order:

1. [INSTALLATION.md](INSTALLATION.md)
2. [DEVELOPMENT_SETUP.md](DEVELOPMENT_SETUP.md)
3. [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md)

## Current Status

The repository is prepared for GitHub and team development. Application modules are organized, generated ZIP artifacts and temporary generation files are excluded, and setup/development documentation is included.

## License

MIT License. See [LICENSE](LICENSE).

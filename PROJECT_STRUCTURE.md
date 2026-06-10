# Project Structure

## Final Folder Structure

```text
food-delivery-marketplace/
├── backend/
│   ├── backend/
│   │   ├── app/
│   │   ├── database/
│   │   └── routes/
│   ├── bootstrap/
│   ├── public/
│   ├── routes/
│   ├── tests/
│   ├── composer.json
│   ├── Dockerfile
│   ├── artisan
│   └── phpunit.xml
├── apps/
│   ├── customer_app/
│   ├── driver_app/
│   ├── restaurant_app/
│   └── admin_dashboard/
├── infrastructure/
│   ├── docker-compose.yml
│   └── nginx/
├── docs/
├── README.md
├── INSTALLATION.md
├── DEVELOPMENT_SETUP.md
├── CONTRIBUTING.md
├── LICENSE
└── REPOSITORY_READY.md
```

## Backend

Laravel API application containing:

- Authentication
- Users and roles
- Restaurant catalog
- Menus and products
- Product sizes and options
- Cart and checkout
- Orders and order lifecycle
- Favorites
- Coupons
- Loyalty
- Referrals
- Subscriptions
- Commissions and settlements
- Notifications
- Reviews
- Support tickets and complaints
- Audit logging

## Mobile Apps

Flutter apps are stored under `apps/`:

- `customer_app`: customer ordering experience
- `driver_app`: delivery driver workflow
- `restaurant_app`: restaurant operations

## Admin Dashboard

The admin dashboard is stored under:

```text
apps/admin_dashboard
```

It contains the platform management interface.

## Infrastructure

Deployment and runtime infrastructure lives under:

```text
infrastructure/
```

It includes Docker Compose and Nginx configuration.

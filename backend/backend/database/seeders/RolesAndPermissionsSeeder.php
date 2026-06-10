<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RolesAndPermissionsSeeder extends Seeder
{
    public function run(): void
    {
        $permissions = [
            'orders.create', 'orders.view_own', 'orders.view_any', 'orders.update_status',
            'restaurants.manage', 'menus.manage', 'drivers.manage', 'finance.manage',
            'subscriptions.manage', 'commissions.manage', 'loyalty.manage', 'referrals.manage',
            'favorites.manage', 'coupons.manage', 'reviews.create', 'notifications.manage',
            'support.create', 'support.manage', 'admin.access',
        ];

        foreach ($permissions as $permission) {
            Permission::findOrCreate($permission, 'web');
        }

        $roles = [
            'customer' => ['orders.create', 'orders.view_own', 'favorites.manage', 'reviews.create', 'support.create', 'notifications.manage'],
            'restaurant_owner' => ['restaurants.manage', 'menus.manage', 'orders.update_status'],
            'restaurant_staff' => ['menus.manage', 'orders.update_status'],
            'driver' => ['orders.update_status'],
            'dispatcher' => ['orders.view_any', 'drivers.manage'],
            'support_agent' => ['orders.view_any', 'support.manage', 'support.create'],
            'finance_admin' => ['finance.manage', 'commissions.manage', 'subscriptions.manage', 'coupons.manage'],
            'super_admin' => $permissions,
        ];

        foreach ($roles as $roleName => $rolePermissions) {
            Role::findOrCreate($roleName, 'web')->syncPermissions($rolePermissions);
        }
    }
}

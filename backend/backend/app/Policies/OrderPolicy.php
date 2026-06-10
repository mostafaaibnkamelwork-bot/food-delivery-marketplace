<?php

namespace App\Policies;

use App\Models\Order;
use App\Models\User;

class OrderPolicy
{
    public function view(User $user, Order $order): bool
    {
        return $user->id === $order->customer_id
            || $user->can('orders.view_any')
            || $user->restaurants()->whereHas('branches', fn ($q) => $q->whereKey($order->branch_id))->exists();
    }

    public function create(User $user): bool
    {
        return $user->can('orders.create');
    }
}

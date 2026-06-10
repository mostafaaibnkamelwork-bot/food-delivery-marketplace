<?php

namespace App\Services\Finance;

use App\Models\Order;
use App\Models\OrderCommission;

class CommissionEngine
{
    public function calculateForOrder(Order $order): OrderCommission
    {
        $restaurant = $order->branch->restaurant;
        $rate = $restaurant->subscriptions()
            ->where('status', 'active')
            ->latest()
            ->first()?->plan?->commission_rate ?? $restaurant->default_commission_rate;

        $platformCommission = round(((float) $order->subtotal * (float) $rate) / 100, 2);
        $driverEarning = (float) $order->delivery_fee;

        return OrderCommission::query()->updateOrCreate(
            ['order_id' => $order->id],
            [
                'restaurant_id' => $restaurant->id,
                'gross_amount' => $order->subtotal,
                'platform_commission' => $platformCommission,
                'restaurant_net_amount' => (float) $order->subtotal - $platformCommission,
                'driver_earning' => $driverEarning,
            ]
        );
    }
}

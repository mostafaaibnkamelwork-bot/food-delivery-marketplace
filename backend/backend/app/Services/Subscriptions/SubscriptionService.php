<?php

namespace App\Services\Subscriptions;

use App\Models\Restaurant;
use App\Models\RestaurantSubscription;
use App\Models\SubscriptionPlan;

class SubscriptionService
{
    public function subscribe(Restaurant $restaurant, SubscriptionPlan $plan): RestaurantSubscription
    {
        $restaurant->subscriptions()->where('status', 'active')->update(['status' => 'cancelled', 'ends_at' => now()]);
        return $restaurant->subscriptions()->create([
            'subscription_plan_id' => $plan->id,
            'status' => 'active',
            'starts_at' => now(),
            'renews_at' => now()->addMonth(),
        ]);
    }
}

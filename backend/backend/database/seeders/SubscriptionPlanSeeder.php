<?php

namespace Database\Seeders;

use App\Models\SubscriptionPlan;
use Illuminate\Database\Seeder;

class SubscriptionPlanSeeder extends Seeder
{
    public function run(): void
    {
        SubscriptionPlan::query()->updateOrCreate(['code' => 'basic'], [
            'name' => 'Basic',
            'price' => 0,
            'billing_cycle' => 'monthly',
            'commission_rate' => 20,
            'features' => ['standard_listing' => true],
            'is_active' => true,
        ]);

        SubscriptionPlan::query()->updateOrCreate(['code' => 'premium'], [
            'name' => 'Premium',
            'price' => 299,
            'billing_cycle' => 'monthly',
            'commission_rate' => 15,
            'features' => ['featured_listing' => true, 'advanced_reports' => true],
            'is_active' => true,
        ]);
    }
}

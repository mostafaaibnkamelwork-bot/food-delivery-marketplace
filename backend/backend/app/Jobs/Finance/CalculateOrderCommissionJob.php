<?php

namespace App\Jobs\Finance;

use App\Models\Order;
use App\Services\Finance\CommissionEngine;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;

class CalculateOrderCommissionJob implements ShouldQueue
{
    use Queueable;
    public function __construct(public int $orderId) {}
    public function handle(CommissionEngine $engine): void
    {
        $engine->calculateForOrder(Order::query()->with('branch.restaurant.subscriptions.plan')->findOrFail($this->orderId));
    }
}

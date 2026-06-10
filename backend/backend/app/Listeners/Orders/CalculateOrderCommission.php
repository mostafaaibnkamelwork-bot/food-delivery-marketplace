<?php

namespace App\Listeners\Orders;

use App\Events\Orders\OrderCreated;
use App\Jobs\Finance\CalculateOrderCommissionJob;

class CalculateOrderCommission
{
    public function handle(OrderCreated $event): void
    {
        CalculateOrderCommissionJob::dispatch($event->order->id);
    }
}

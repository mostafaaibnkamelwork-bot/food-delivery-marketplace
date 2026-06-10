<?php

namespace App\Providers;

use App\Events\Orders\OrderCreated;
use App\Listeners\Orders\CalculateOrderCommission;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        OrderCreated::class => [CalculateOrderCommission::class],
    ];
}

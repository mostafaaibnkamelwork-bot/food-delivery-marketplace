<?php

namespace App\Providers;

use App\Repositories\Eloquent\CommissionRuleRepository;
use App\Repositories\Eloquent\OrderRepository;
use App\Repositories\Eloquent\ProductRepository;
use App\Repositories\Eloquent\RestaurantRepository;
use App\Repositories\Eloquent\UserRepository;
use Illuminate\Support\ServiceProvider;

class RepositoryServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->bind('repositories.users', UserRepository::class);
        $this->app->bind('repositories.restaurants', RestaurantRepository::class);
        $this->app->bind('repositories.products', ProductRepository::class);
        $this->app->bind('repositories.orders', OrderRepository::class);
        $this->app->bind('repositories.commission_rules', CommissionRuleRepository::class);
    }
}

<?php

use Illuminate\Support\Facades\Artisan;

Artisan::command('app:status', function () {
    $this->info('Food delivery marketplace backend is installed.');
});

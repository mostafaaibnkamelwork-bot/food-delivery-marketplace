<?php

namespace App\Http\Controllers\Api\Backoffice;

use App\Http\Controllers\Api\CrudController;
use App\Models\SubscriptionPlan;

class SubscriptionPlanController extends CrudController
{
    protected string $model = SubscriptionPlan::class;
    protected array $with = ['subscriptions'];
    protected array $storeRules = ['name'=>['required','string'],'code'=>['required','string'],'price'=>['required','numeric'],'billing_cycle'=>['required','string']];
}

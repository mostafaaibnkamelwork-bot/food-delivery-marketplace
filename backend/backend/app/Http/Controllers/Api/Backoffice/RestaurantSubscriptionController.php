<?php

namespace App\Http\Controllers\Api\Backoffice;

use App\Http\Controllers\Api\CrudController;
use App\Models\RestaurantSubscription;

class RestaurantSubscriptionController extends CrudController
{
    protected string $model = RestaurantSubscription::class;
    protected array $with = ['restaurant','plan'];
    protected array $storeRules = ['restaurant_id'=>['required','exists:restaurants,id'],'subscription_plan_id'=>['required','exists:subscription_plans,id'],'status'=>['required','string'],'starts_at'=>['required','date']];
}

<?php

namespace App\Http\Controllers\Api\Backoffice;

use App\Http\Controllers\Api\CrudController;
use App\Models\Restaurant;

class RestaurantController extends CrudController
{
    protected string $model = Restaurant::class;
    protected array $with = ['branches','categories'];
    protected array $storeRules = ['owner_id'=>['required','exists:users,id'],'name'=>['required','string'],'slug'=>['required','string'],'status'=>['required','string'],'default_commission_rate'=>['numeric']];
}

<?php

namespace App\Http\Controllers\Api\Backoffice;

use App\Http\Controllers\Api\CrudController;
use App\Models\Coupon;

class CouponController extends CrudController
{
    protected string $model = Coupon::class;
    protected array $with = ['usages'];
    protected array $storeRules = ['code'=>['required','string'],'name'=>['required','string'],'discount_type'=>['required','string'],'discount_value'=>['required','numeric'],'status'=>['required','string']];
}

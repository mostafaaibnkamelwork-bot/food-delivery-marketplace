<?php

namespace App\Http\Controllers\Api\Backoffice;

use App\Http\Controllers\Api\CrudController;
use App\Models\RestaurantBranch;

class BranchController extends CrudController
{
    protected string $model = RestaurantBranch::class;
    protected array $with = ['restaurant'];
    protected array $storeRules = ['restaurant_id'=>['required','exists:restaurants,id'],'name'=>['required','string'],'address'=>['required','string'],'city'=>['required','string'],'latitude'=>['required','numeric'],'longitude'=>['required','numeric'],'status'=>['required','string']];
}

<?php

namespace App\Http\Controllers\Api\Backoffice;

use App\Http\Controllers\Api\CrudController;
use App\Models\Review;

class ReviewController extends CrudController
{
    protected string $model = Review::class;
    protected array $with = ['user','restaurant','product','driver','images'];
    protected array $storeRules = ['user_id'=>['required','exists:users,id'],'rating'=>['required','integer','min:1','max:5'],'comment'=>['nullable','string']];
}

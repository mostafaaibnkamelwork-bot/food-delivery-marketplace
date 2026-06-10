<?php

namespace App\Http\Controllers\Api\Backoffice;

use App\Http\Controllers\Api\CrudController;
use App\Models\Product;

class ProductController extends CrudController
{
    protected string $model = Product::class;
    protected array $with = ['images','sizes','options.values'];
    protected array $storeRules = ['branch_id'=>['required','exists:restaurant_branches,id'],'name'=>['required','string'],'price'=>['required','numeric'],'status'=>['required','string']];
}

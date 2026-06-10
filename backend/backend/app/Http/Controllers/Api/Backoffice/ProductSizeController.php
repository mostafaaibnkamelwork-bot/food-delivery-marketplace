<?php

namespace App\Http\Controllers\Api\Backoffice;

use App\Http\Controllers\Api\CrudController;
use App\Models\ProductSize;

class ProductSizeController extends CrudController
{
    protected string $model = ProductSize::class;
    protected array $with = ['product'];
    protected array $storeRules = ['product_id'=>['required','exists:products,id'],'name'=>['required','string'],'price'=>['required','numeric']];
}

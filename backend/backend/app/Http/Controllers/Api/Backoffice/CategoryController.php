<?php

namespace App\Http\Controllers\Api\Backoffice;

use App\Http\Controllers\Api\CrudController;
use App\Models\Category;

class CategoryController extends CrudController
{
    protected string $model = Category::class;
    protected array $with = [];
    protected array $storeRules = ['name'=>['required','string'],'slug'=>['required','string'],'type'=>['required','string']];
}

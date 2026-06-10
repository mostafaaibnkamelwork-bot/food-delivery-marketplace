<?php

namespace App\Http\Controllers\Api\Backoffice;

use App\Http\Controllers\Api\CrudController;
use App\Models\User;

class AdminUserController extends CrudController
{
    protected string $model = User::class;
    protected array $with = ['roles'];
    protected array $storeRules = ['name'=>['required','string','max:150'],'email'=>['nullable','email'],'phone'=>['nullable','string'],'password'=>['sometimes','string','min:8'],'status'=>['required','string']];
}

<?php

namespace App\Http\Controllers\Api\Backoffice;

use App\Http\Controllers\Api\CrudController;
use App\Models\Settlement;

class SettlementController extends CrudController
{
    protected string $model = Settlement::class;
    protected array $with = ['items'];
    protected array $storeRules = ['settlement_number'=>['required','string'],'type'=>['required','string'],'status'=>['required','string'],'period_start'=>['required','date'],'period_end'=>['required','date']];
}

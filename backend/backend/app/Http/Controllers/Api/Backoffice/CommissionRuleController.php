<?php

namespace App\Http\Controllers\Api\Backoffice;

use App\Http\Controllers\Api\CrudController;
use App\Models\CommissionRule;

class CommissionRuleController extends CrudController
{
    protected string $model = CommissionRule::class;
    protected array $with = ['restaurant','plan'];
    protected array $storeRules = ['name'=>['required','string'],'scope'=>['required','string'],'commission_type'=>['required','string'],'commission_value'=>['required','numeric']];
}

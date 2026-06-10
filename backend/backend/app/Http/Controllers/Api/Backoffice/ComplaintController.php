<?php

namespace App\Http\Controllers\Api\Backoffice;

use App\Http\Controllers\Api\CrudController;
use App\Models\Complaint;

class ComplaintController extends CrudController
{
    protected string $model = Complaint::class;
    protected array $with = ['user','order','restaurant','driver'];
    protected array $storeRules = ['user_id'=>['required','exists:users,id'],'complaint_type'=>['required','string'],'description'=>['required','string'],'status'=>['required','string']];
}

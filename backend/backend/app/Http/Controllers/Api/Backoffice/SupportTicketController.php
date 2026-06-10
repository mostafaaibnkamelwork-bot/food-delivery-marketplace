<?php

namespace App\Http\Controllers\Api\Backoffice;

use App\Http\Controllers\Api\CrudController;
use App\Models\SupportTicket;

class SupportTicketController extends CrudController
{
    protected string $model = SupportTicket::class;
    protected array $with = ['user','order','messages'];
    protected array $storeRules = ['user_id'=>['required','exists:users,id'],'subject'=>['required','string'],'category'=>['required','string'],'priority'=>['required','string'],'status'=>['required','string']];
}

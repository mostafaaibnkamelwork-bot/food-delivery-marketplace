<?php

namespace App\Repositories\Eloquent;

use App\Models\CommissionRule;

class CommissionRuleRepository extends BaseRepository
{
    public function __construct(CommissionRule $model) { parent::__construct($model); }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class OrderCommission extends Model { protected $guarded = []; public function order(): BelongsTo { return $this->belongsTo(Order::class); } public function restaurant(): BelongsTo { return $this->belongsTo(Restaurant::class); } public function rule(): BelongsTo { return $this->belongsTo(CommissionRule::class, 'rule_id'); } }

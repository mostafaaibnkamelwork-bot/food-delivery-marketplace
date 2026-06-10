<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class DriverEarning extends Model { protected $guarded = []; public function driver(): BelongsTo { return $this->belongsTo(Driver::class); } public function order(): BelongsTo { return $this->belongsTo(Order::class); } }

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class OrderItem extends Model { protected $guarded = []; protected $casts = ['options' => 'array']; public function order(): BelongsTo { return $this->belongsTo(Order::class); } public function product(): BelongsTo { return $this->belongsTo(Product::class); } }

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class FavoriteRestaurant extends Model { protected $guarded = []; public function user(): BelongsTo { return $this->belongsTo(User::class); } public function restaurant(): BelongsTo { return $this->belongsTo(Restaurant::class); } }

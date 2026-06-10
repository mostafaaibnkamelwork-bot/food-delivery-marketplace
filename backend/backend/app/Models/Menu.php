<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Menu extends Model { protected $guarded = []; public function branch(): BelongsTo { return $this->belongsTo(RestaurantBranch::class, 'branch_id'); } public function sections(): HasMany { return $this->hasMany(MenuSection::class); } }

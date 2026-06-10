<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class RestaurantBranch extends Model { use SoftDeletes; protected $guarded = []; public function restaurant(): BelongsTo { return $this->belongsTo(Restaurant::class); } public function menus(): HasMany { return $this->hasMany(Menu::class, 'branch_id'); } public function products(): HasMany { return $this->hasMany(Product::class, 'branch_id'); } public function orders(): HasMany { return $this->hasMany(Order::class, 'branch_id'); } }

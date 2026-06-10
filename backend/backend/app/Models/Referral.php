<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Referral extends Model { protected $guarded = []; public function referrer(): BelongsTo { return $this->belongsTo(User::class, 'referrer_id'); } public function referred(): BelongsTo { return $this->belongsTo(User::class, 'referred_id'); } public function rewards(): HasMany { return $this->hasMany(ReferralReward::class); } }

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class AuditLog extends Model { protected $guarded = []; protected $casts = ['old_values' => 'array', 'new_values' => 'array']; public function actor(): BelongsTo { return $this->belongsTo(User::class, 'actor_id'); } }

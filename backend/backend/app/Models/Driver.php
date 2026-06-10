<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Driver extends Model
{
    protected $guarded = [];

    public function user(): BelongsTo { return $this->belongsTo(User::class); }
    public function earnings(): HasMany { return $this->hasMany(DriverEarning::class); }
    public function reviews(): HasMany { return $this->hasMany(Review::class); }
    public function complaints(): HasMany { return $this->hasMany(Complaint::class); }
}

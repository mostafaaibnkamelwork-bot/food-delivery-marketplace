<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Review extends Model
{
    use SoftDeletes;

    protected $guarded = [];

    public function user(): BelongsTo { return $this->belongsTo(User::class); }
    public function order(): BelongsTo { return $this->belongsTo(Order::class); }
    public function restaurant(): BelongsTo { return $this->belongsTo(Restaurant::class); }
    public function product(): BelongsTo { return $this->belongsTo(Product::class); }
    public function driver(): BelongsTo { return $this->belongsTo(Driver::class); }
    public function images(): HasMany { return $this->hasMany(ReviewImage::class); }
}

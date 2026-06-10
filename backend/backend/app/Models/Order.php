<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Order extends Model
{
    protected $guarded = [];

    public function customer(): BelongsTo { return $this->belongsTo(User::class, 'customer_id'); }
    public function branch(): BelongsTo { return $this->belongsTo(RestaurantBranch::class, 'branch_id'); }
    public function driver(): BelongsTo { return $this->belongsTo(Driver::class); }
    public function items(): HasMany { return $this->hasMany(OrderItem::class); }
    public function histories(): HasMany { return $this->hasMany(OrderStatusHistory::class); }
    public function payment(): HasOne { return $this->hasOne(Payment::class); }
    public function commission(): HasOne { return $this->hasOne(OrderCommission::class); }
    public function couponUsages(): HasMany { return $this->hasMany(CouponUsage::class); }
    public function reviews(): HasMany { return $this->hasMany(Review::class); }
    public function supportTickets(): HasMany { return $this->hasMany(SupportTicket::class); }
    public function complaints(): HasMany { return $this->hasMany(Complaint::class); }
}

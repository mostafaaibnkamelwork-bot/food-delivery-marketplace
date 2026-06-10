<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, HasRoles, Notifiable;

    protected $guarded = [];
    protected $hidden = ['password', 'remember_token'];
    protected $casts = ['email_verified_at' => 'datetime', 'phone_verified_at' => 'datetime', 'password' => 'hashed'];

    public function profile(): HasOne { return $this->hasOne(UserProfile::class); }
    public function addresses(): HasMany { return $this->hasMany(CustomerAddress::class); }
    public function restaurants(): HasMany { return $this->hasMany(Restaurant::class, 'owner_id'); }
    public function carts(): HasMany { return $this->hasMany(Cart::class); }
    public function orders(): HasMany { return $this->hasMany(Order::class, 'customer_id'); }
    public function driver(): HasOne { return $this->hasOne(Driver::class); }
    public function rewardPoint(): HasOne { return $this->hasOne(RewardPoint::class); }
    public function rewardTransactions(): HasMany { return $this->hasMany(RewardTransaction::class); }
    public function deviceTokens(): HasMany { return $this->hasMany(DeviceToken::class); }
    public function reviews(): HasMany { return $this->hasMany(Review::class); }
    public function supportTickets(): HasMany { return $this->hasMany(SupportTicket::class); }
    public function complaints(): HasMany { return $this->hasMany(Complaint::class); }
    public function couponUsages(): HasMany { return $this->hasMany(CouponUsage::class); }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Restaurant extends Model
{
    use SoftDeletes;

    protected $guarded = [];

    public function owner(): BelongsTo { return $this->belongsTo(User::class, 'owner_id'); }
    public function branches(): HasMany { return $this->hasMany(RestaurantBranch::class); }
    public function categories(): BelongsToMany { return $this->belongsToMany(Category::class, 'restaurant_categories'); }
    public function subscriptions(): HasMany { return $this->hasMany(RestaurantSubscription::class); }
    public function commissionRules(): HasMany { return $this->hasMany(CommissionRule::class); }
    public function reviews(): HasMany { return $this->hasMany(Review::class); }
    public function complaints(): HasMany { return $this->hasMany(Complaint::class); }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Product extends Model
{
    use SoftDeletes;

    protected $guarded = [];

    public function branch(): BelongsTo { return $this->belongsTo(RestaurantBranch::class, 'branch_id'); }
    public function section(): BelongsTo { return $this->belongsTo(MenuSection::class, 'menu_section_id'); }
    public function images(): HasMany { return $this->hasMany(ProductImage::class); }
    public function sizes(): HasMany { return $this->hasMany(ProductSize::class); }
    public function options(): HasMany { return $this->hasMany(ProductOption::class); }
    public function reviews(): HasMany { return $this->hasMany(Review::class); }
}

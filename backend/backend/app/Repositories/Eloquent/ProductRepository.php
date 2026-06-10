<?php

namespace App\Repositories\Eloquent;

use App\Models\Product;

class ProductRepository extends BaseRepository
{
    public function __construct(Product $model) { parent::__construct($model); }
}

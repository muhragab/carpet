<?php

namespace App;

use App\Models\Products\Product;
use Illuminate\Database\Eloquent\Model;

class StoreProductBank extends Model
{
    protected $fillable = ['store_id', 'product_id', 'number'];

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }

}

<?php

namespace App;

use App\Models\Products\Product;
use Illuminate\Database\Eloquent\Model;

class StoresProduct extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'store_id',
        'product_id',
        'storeNumber',
        'number',
    ];

    public function product()
    {
        return $this->hasOne(Product::class, 'id', 'product_id');
    }
}

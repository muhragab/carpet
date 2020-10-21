<?php

namespace App\Models\Purchases;

use Illuminate\Database\Eloquent\Model;

use App\Models\Products\Product;

class BackPurchaseItem extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'purchase_id',
        'product_id',
        'number',
        'price',
        'total_price'
    ];

    public function getTotalAttribute()
    {
        return $this->number * $this->price;
    }

    public function product()
    {
        return $this->hasOne(Product::class, 'id', 'product_id');
    }

    public function purchase()
    {
        return $this->belongsTo(BackPurchase::class, 'purchase_id');
    }
}

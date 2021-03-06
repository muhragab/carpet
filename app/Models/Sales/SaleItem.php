<?php

namespace App\Models\Sales;

use App\Models\Products\Product;

use Illuminate\Database\Eloquent\Model;

class SaleItem extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'sale_id',
        'product_id',
        'number',
        'price',
        'total_price'
    ];

    public function getTotalAttribute()
    {
        return $this->number*$this->price;
    }

    public function product()
    {
        return $this->hasOne(Product::class, 'id', 'product_id');
    }


    public function sale()
    {
        return $this->belongsTo(Sale::class, 'sale_id');
    }
}

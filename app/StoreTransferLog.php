<?php

namespace App;
use App\Models\Products\Product;

use Illuminate\Database\Eloquent\Model;

class StoreTransferLog extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'store_from_id',
        'store_to_id',
        'product_id',
        'number',
        'orderNumber',
        'transfer_date'
    ];

    public function store_from()
    {
        return $this->hasOne(Store::class, 'id', 'store_from_id');
    }

    public function store_to()
    {
        return $this->hasOne(Store::class, 'id', 'store_to_id');
    }

    public function product()
    {
        return $this->hasOne(Product::class, 'id', 'product_id');
    }
}

<?php

namespace App\Models\Purchases;

use App\Models\Purchases\PurchaseItem;
use App\Models\Purchases\Supplier;
use Illuminate\Database\Eloquent\Model;

class BackPurchase extends Model
{
    protected $fillable = [
        'supplier_id',
        'inventorie_id',
        'permission_number',
        'permission_number',
        'discount',
        'finalPrice',
        'price',
        'allMeters',
        'priceFinal',
        'taxes'
    ];

    public function supplier()
    {
        return $this->hasOne(Supplier::class, 'id', 'supplier_id');
    }

    public function items()
    {
        return $this->hasMany(BackPurchaseItem::class, 'purchase_id', 'id');
    }
}

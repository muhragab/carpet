<?php

namespace App\Models\Purchases;

use App\Models\Purchases\PurchaseItem;
use App\Models\Purchases\Supplier;
use App\Store;
use Illuminate\Database\Eloquent\Model;

class BackPurchase extends Model
{
    protected $fillable = [
        'supplier_id',
        'inventorie_id',
        'permission_number',
        'discount',
        'finalPrice',
        'price',
        'allMeters',
        'priceFinal',
        'taxes',
        'date'
    ];
    public function supplier()
    {
        return $this->hasOne(Supplier::class, 'id', 'supplier_id');
    }

    public function stores()
    {
        return $this->hasOne(Store::class, 'id', 'inventorie_id');
    }

    public function store()
    {
        return $this->belongsTo(Store::class, 'inventorie_id');
    }

    public function items()
    {
        return $this->hasMany(BackPurchaseItem::class, 'purchase_id', 'id');
    }
}

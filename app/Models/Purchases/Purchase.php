<?php

namespace App\Models\Purchases;

use App\Store;
use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
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
        'taxes',
        'date',
        'status',
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
        return $this->hasMany(PurchaseItem::class, 'purchase_id', 'id');
    }
}

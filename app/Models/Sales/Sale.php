<?php

namespace App\Models\Sales;

use App\Models\Purchases\Supplier;

use App\Models\SalesMan;
use App\Store;
use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'supplier_id',
        'sale_man',
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

    public function saleMan()
    {
        return $this->belongsTo(SalesMan::class, 'sale_man');
    }

    public function items()
    {
        return $this->hasMany(SaleItem::class, 'sale_id', 'id');
    }
}

<?php

namespace App\Models\Sales;

use App\Models\Purchases\Supplier;

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
        'inventorie_id',
        'permission_number',
        'price',
        'taxes'
    ];

    public function supplier()
    {
        return $this->hasOne(Supplier::class, 'id', 'supplier_id');
    }

    public function items()
    {
        return $this->hasMany(SaleItem::class, 'sale_id', 'id');
    }
}

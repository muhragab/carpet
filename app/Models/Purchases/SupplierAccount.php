<?php

namespace App\Models\Purchases;

use Illuminate\Database\Eloquent\Model;

class SupplierAccount extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'supplier_id',
        'balance',
        'description',
        'type'
    ];
}

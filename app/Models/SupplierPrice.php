<?php

namespace App\Models;

use App\Models\Products\ProductTypes;
use App\Models\Purchases\Supplier;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class SupplierPrice
 * @package App\Models
 * @version July 4, 2020, 11:38 am UTC
 *
 * @property integer supplier_id
 * @property integer product_id
 * @property string price
 */
class SupplierPrice extends Model
{
    use SoftDeletes;

    public $table = 'supplier_prices';


    protected $dates = ['deleted_at'];


    public $fillable = [
        'supplier_id',
        'product_id',
        'price'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'supplier_id' => 'integer',
        'product_id' => 'integer',
        'price' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'supplier_id' => 'required|exists:suppliers,id',
        'product_id' => 'required|exists:products,id',
        'price' => 'required'
    ];

    public function supplier()
    {
        return $this->belongsTo(Supplier::class, 'supplier_id');
    }

    public function product()
    {
        return $this->belongsTo(ProductTypes::class, 'product_id');
    }
}

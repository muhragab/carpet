<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class SalesMan
 * @package App\Models
 * @version May 23, 2020, 10:19 pm UTC
 *
 * @property string name
 * @property string address
 * @property string phoneNumber
 * @property string phone
 * @property string faxNum
 * @property string email
 */
class SalesMan extends Model
{
    use SoftDeletes;

    public $table = 'sales_men';
    

    protected $dates = ['deleted_at'];



    public $fillable = [
        'name',
        'address',
        'phoneNumber',
        'phone',
        'faxNum',
        'email'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'name' => 'string',
        'address' => 'string',
        'phoneNumber' => 'string',
        'phone' => 'string',
        'faxNum' => 'string',
        'email' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required|string',
        'address' => 'required|string',
        'phoneNumber' => 'required',
        'phone' => 'nullable',
        'faxNum' => 'nullable',
        'email' => 'nullable|email'
    ];

    
}

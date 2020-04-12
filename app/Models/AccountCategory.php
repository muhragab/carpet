<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class AccountCategory
 * @package App\Models
 * @version April 1, 2020, 10:39 pm UTC
 *
 * @property string title
 * @property integer number
 */
class AccountCategory extends Model
{
    use SoftDeletes;

    public $table = 'account_categories';
    

    protected $dates = ['deleted_at'];



    public $fillable = [
        'title',
        'number'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'title' => 'string',
        'number' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'title' => 'required'
    ];

    
}

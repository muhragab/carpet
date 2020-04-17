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

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'title' => 'required'
    ];
    public $table = 'account_categories';
    public $fillable = [
        'title',
        'number'
    ];
    protected $dates = ['deleted_at'];
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

    protected static function boot()
    {
        parent::boot();

        static::deleted(function ($category) {
            $category->subCategory()->delete();
        });
    }

    public function subCategory()
    {
        return $this->hasMany(SubAccountCategory::class, 'category_id');
    }
}

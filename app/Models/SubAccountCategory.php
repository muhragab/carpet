<?php

namespace App\Models;

use App\AccountStatement;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class SubAccountCategory
 * @package App\Models
 * @version April 8, 2020, 7:08 pm UTC
 *
 * @property string category_id
 * @property string title
 * @property string number
 */
class SubAccountCategory extends Model
{
    use SoftDeletes;

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'category_id' => 'required',
        'title' => 'required',
        //   'number' => 'required'
    ];
    public $table = 'sub_account_categories';
    public $fillable = [
        'category_id',
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
        'category_id' => 'string',
        'title' => 'string',
        'number' => 'string'
    ];

    protected static function boot()
    {
        parent::boot();

        static::deleted(function ($category) {
            $category->accountStatment()->delete();
        });
    }

    public function accountStatment()
    {
        return $this->hasMany(AccountStatement::class, 'category');
    }

    public function category()
    {
        return $this->belongsTo(AccountCategory::class, 'category_id');
    }
}

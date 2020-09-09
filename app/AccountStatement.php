<?php

namespace App;

use App\Models\Purchases\Supplier;
use App\Models\SubAccountCategory;
use Illuminate\Database\Eloquent\Model;

class AccountStatement extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'account_id',
        'statement',
        'category',
        'date',
        'statement_type',
        'amount',
        'type',
    ];

    public function account()
    {
        return $this->belongsTo(Account::class, 'account_id');
    }


    public function cat()
    {
        return $this->belongsTo(SubAccountCategory::class, 'category');
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class, 'category');
    }
}

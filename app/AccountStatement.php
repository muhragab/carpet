<?php

namespace App;

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
    ];

    public function cat()
    {
        return $this->belongsTo(SubAccountCategory::class, 'category');
    }
}

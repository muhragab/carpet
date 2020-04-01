<?php

namespace App;

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
        'statement_type',
        'amount',
    ];
}

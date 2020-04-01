<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Account extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
    ];

    public function statements()
    {
        return $this->hasMany(AccountStatement::class, 'account_id', 'id');
    }
}

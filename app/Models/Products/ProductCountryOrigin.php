<?php

namespace App\Models\Products;

use Illuminate\Database\Eloquent\Model;

class ProductCountryOrigin extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
    ];
}

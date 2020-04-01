<?php

namespace App\Models\Items;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'category_id',
        'name',
    ];

    public function children()
    {
        return $this->hasMany(Category::class, 'category_id');
    }
}

<?php

namespace App\Models\Products;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'category_id',
        // 'sub_category_id',
        'type_id',
        'color_id',
        'plotter_id',
        'country_origin_id',
        'name',
        'image_path',
        'sizes_length',
        'sizes_width',
        'average_demand_limit',
        'maximum_demand_limit',
        'price_meter',
    ];

    protected $appends = ['full_name'];
//' . $this->price_meter . 'EGP (' . ($this->sizes_length * $this->sizes_width) * $this->price_meter . 'EGP
    public function getFullNameAttribute()
    {
        return $this->name . ' | ' . $this->sizes_width . '×' . $this->sizes_length . '(' . $this->sizes_length * $this->sizes_width . ')';
    }
}

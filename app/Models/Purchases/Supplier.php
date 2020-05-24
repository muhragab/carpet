<?php

namespace App\Models\Purchases;

use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'adress',
        'phone_number',
        'ground_number',
        'fax_number',
        'email',
        'is_supplier',
        'is_client',
        'status',
    ];

    public function getIsAttribute()
    {
        $text_out = '';
        
        if ($this->is_supplier) {
            $text_out .= 'مورد';

            if ($this->is_client) {
                $text_out .= ' - ';
            }
        }

        if ($this->is_client) {
            $text_out .= 'عميل';
        }

        return $text_out;
    }

    public function getIsLinkAttribute()
    {
        $arr_out = [];
        
        if ($this->is_supplier) {
            $arr_out['is_supplier'] = 1;
        }

        if ($this->is_client) {
            $arr_out['is_client'] = 1;

        }

        return $arr_out;
    }

    public function account()
    {
        return $this->hasMany(SupplierAccount::class, 'supplier_id', 'id');
    }
}

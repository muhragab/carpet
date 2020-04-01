<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Komicho\Laravel\ModelActivity\Traits\LogActivity;

class Store extends Model
{
    use LogActivity;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
    ];

    public function products()
    {
        return $this->hasMany(StoresProduct::class, 'store_id', 'id');
    }

    public function logs_transfer_from()
    {
        return $this->hasMany(StoreTransferLog::class, 'store_from_id', 'id');
    }

    public function logs_transfer_to()
    {
        return $this->hasMany(StoreTransferLog::class, 'store_to_id', 'id')
            ->where('acceptance', '!=', 'pending');
    }
}

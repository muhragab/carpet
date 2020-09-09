<?php

namespace App\Repositories;

use App\Models\SupplierPrice;
use App\Repositories\BaseRepository;

/**
 * Class SupplierPriceRepository
 * @package App\Repositories
 * @version July 4, 2020, 11:38 am UTC
*/

class SupplierPriceRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'supplier_id',
        'product_id',
        'price'
    ];

    /**
     * Return searchable fields
     *
     * @return array
     */
    public function getFieldsSearchable()
    {
        return $this->fieldSearchable;
    }

    /**
     * Configure the Model
     **/
    public function model()
    {
        return SupplierPrice::class;
    }
}

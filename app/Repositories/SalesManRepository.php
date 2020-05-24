<?php

namespace App\Repositories;

use App\Models\SalesMan;
use App\Repositories\BaseRepository;

/**
 * Class SalesManRepository
 * @package App\Repositories
 * @version May 23, 2020, 10:19 pm UTC
*/

class SalesManRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'name',
        'address',
        'phoneNumber',
        'phone',
        'faxNum',
        'email'
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
        return SalesMan::class;
    }
}

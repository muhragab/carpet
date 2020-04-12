<?php

namespace App\Repositories;

use App\Models\AccountCategory;
use App\Repositories\BaseRepository;

/**
 * Class AccountCategoryRepository
 * @package App\Repositories
 * @version April 1, 2020, 10:39 pm UTC
*/

class AccountCategoryRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'title',
        'number'
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
        return AccountCategory::class;
    }
}

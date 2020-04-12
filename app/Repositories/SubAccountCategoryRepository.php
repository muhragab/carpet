<?php

namespace App\Repositories;

use App\Models\SubAccountCategory;
use App\Repositories\BaseRepository;

/**
 * Class SubAccountCategoryRepository
 * @package App\Repositories
 * @version April 8, 2020, 7:08 pm UTC
*/

class SubAccountCategoryRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'category_id',
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
        return SubAccountCategory::class;
    }
}

<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\SubAccountCategory;
use Faker\Generator as Faker;

$factory->define(SubAccountCategory::class, function (Faker $faker) {

    return [
        'category_id' => $faker->word,
        'title' => $faker->word,
        'number' => $faker->word,
        'created_at' => $faker->date('Y-m-d H:i:s'),
        'updated_at' => $faker->date('Y-m-d H:i:s')
    ];
});

<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\AccountCategory;
use Faker\Generator as Faker;

$factory->define(AccountCategory::class, function (Faker $faker) {

    return [
        'title' => $faker->word,
        'number' => $faker->randomDigitNotNull,
        'created_at' => $faker->date('Y-m-d H:i:s'),
        'updated_at' => $faker->date('Y-m-d H:i:s')
    ];
});

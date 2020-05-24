<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\SalesMan;
use Faker\Generator as Faker;

$factory->define(SalesMan::class, function (Faker $faker) {

    return [
        'name' => $faker->word,
        'address' => $faker->word,
        'phoneNumber' => $faker->word,
        'phone' => $faker->word,
        'faxNum' => $faker->word,
        'email' => $faker->word,
        'created_at' => $faker->date('Y-m-d H:i:s'),
        'updated_at' => $faker->date('Y-m-d H:i:s')
    ];
});

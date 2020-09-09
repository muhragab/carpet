<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\SupplierPrice;
use Faker\Generator as Faker;

$factory->define(SupplierPrice::class, function (Faker $faker) {

    return [
        'supplier_id' => $faker->randomDigitNotNull,
        'product_id' => $faker->randomDigitNotNull,
        'price' => $faker->word,
        'created_at' => $faker->date('Y-m-d H:i:s'),
        'updated_at' => $faker->date('Y-m-d H:i:s')
    ];
});

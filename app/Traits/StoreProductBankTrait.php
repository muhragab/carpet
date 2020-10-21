<?php
/**
 * Created by PhpStorm.
 * User: macbook
 * Date: 2020-09-20
 * Time: 10:01
 */

namespace App\Traits;

use App\StoreProductBank;

trait StoreProductBankTrait
{

    public function storeProductBank($product_id, $store_id, $number)
    {
        $checkOldNumber = StoreProductBank::where([
            'store_id' => $store_id,
            'product_id' => $product_id
        ])->first();

        if (!is_null($checkOldNumber)) {
            $finalNumber = $checkOldNumber->number + $number;
        } else {
            $finalNumber = $number;
        }

        StoreProductBank::updateOrCreate(
            ['store_id' => $store_id, 'product_id' => $product_id],
            ['store_id' => $store_id, 'product_id' => $product_id, 'number' => $finalNumber]
        );

    }
}
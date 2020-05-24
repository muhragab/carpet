<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Store;
use Illuminate\Http\Request;

use App\Models\Purchases\SupplierAccount;
use App\Models\Purchases\{BackPurchase, BackPurchaseItem, Purchase};

class PurchaseBackController extends Controller
{


    public function permission_number()
    {
        return $oreder_number = BackPurchase::count() + 1;
    }

    public function save(Request $request)
    {
        //SQLSTATE[23000]: Integrity constraint violation: 1452 Cannot add or update a
        // child row: a foreign key constraint fails
        // (`carpts`.`back_purchase_items`, CONSTRAINT `
        //back_purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`)
        // REFERENCES `purchases` (`id`) ON DELETE CASCADE) (SQL: insert into `back_purchase_items` (`purchase_id`, `product_id`, `number`, `price`, `total_price`, `updated_at`, `created_at`) values (2, 1, 10, 100, 1000, 2020-04-12 14:29:15, 2020-04-12 14:29:15))",  dd($request->inventorie_id);

        $data = $request->only([
            'supplier_id',
            'inventorie_id',
            'permission_number',
            'finalPrice',
            'discount',
            'taxes',
            'date'
        ]);

        $data['price'] = null;
        $final = array_merge($data, ['priceFinal' => $request->allPrice, 'allMeters' => $request->allMeters]);
        $purchase = BackPurchase::create($final);
        $items = $request->items;

        foreach ($items as $item) {
            BackPurchaseItem::create([
                'purchase_id' => $purchase->id,
                'product_id' => $item['product_id'],
                'number' => $item['number'],
                'price' => $item['price'],
                'total_price' => $item['number'] * $item['price']
            ]);
        }

        $purchase->price = BackPurchaseItem::where('purchase_id', '=', $purchase->id)->
        where('product_id', '=', $item['product_id'])
            ->sum('total_price');
        $purchase->save();

        SupplierAccount::create([
            'supplier_id' => $purchase->supplier_id,
            'balance' => $purchase->price,
            'type' => 'deposit',
        ]);

        return 'done';
    }
}

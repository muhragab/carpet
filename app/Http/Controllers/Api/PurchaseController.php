<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Store;
use App\Traits\StoreProductBankTrait;
use Illuminate\Http\Request;

use App\Models\Purchases\SupplierAccount;
use App\Models\Purchases\{Purchase, PurchaseItem};

class PurchaseController extends Controller
{
    use StoreProductBankTrait;

    public function stores()
    {
        return Store::get();
    }

    public function permission_number()
    {
        return $oreder_number = Purchase::count() + 1;
    }

    public function save(Request $request)
    {

        $request->validate([
            'supplier_id' => 'required',
            'inventorie_id' => 'required',
            'date' => 'required',
        ]);
        $data = $request->only([
            'supplier_id',
            'inventorie_id',
            'permission_number',
            'finalPrice',
            'discount',
            'taxes',
            'date'
        ]);
        $priceFinal = ($request->allPrice + ($request->allPrice * $request->taxes / 100)) -
            (($request->allPrice + ($request->allPrice * $request->taxes / 100)) * ($request->discount / 100));

        $data['price'] = null;
        if ($request->finalPrice == null || $request->finalPrice = '')
            $data['finalPrice'] = $priceFinal;

        $final = array_merge($data, ['priceFinal' => $priceFinal, 'allMeters' => $request->allMeters]);
        $purchase = Purchase::create($final);
        $items = $request->items;

        foreach ($items as $item) {
            PurchaseItem::create([
                'purchase_id' => $purchase->id,
                'product_id' => $item['product_id'],
                'number' => $item['number'],
                'price' => $item['price'],
                'total_price' => $item['number'] * $item['price']
            ]);

        }

        $purchase->price = PurchaseItem::where('purchase_id', '=', $purchase->id)->
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

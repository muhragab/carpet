<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\SalesMan;
use Illuminate\Http\Request;

use App\Models\Purchases\SupplierAccount;
use App\Models\Sales\{Sale, SaleItem};

class SaleController extends Controller
{
    public function permission_number()
    {
        return $oreder_number = Sale::count() + 1;
    }

    public function salesMen()
    {
        return SalesMan::get();
    }

    public function save(Request $request)
    {
        $data = $request->only([
            'supplier_id',
            'sale_man',
            'inventorie_id',
            'permission_number',
            'finalPrice',
            'discount',
            'taxes',
            'date'
        ]);

        $data['price'] = null;

        $sale = Sale::create($data);

        $items = $request->items;

        foreach ($items as $item) {
            SaleItem::create([
                'sale_id' => $sale->id,
                'product_id' => $item['product_id'],
                'number' => $item['number'],
                'price' => $item['price'],
                'total_price' => $item['number'] * $item['price']
            ]);
        }

        $sale->price = SaleItem::where('sale_id', '=', $sale->id)->where('product_id', '=', $item['product_id'])->sum('total_price');
        $sale->save();

        SupplierAccount::create([
            'supplier_id' => $sale->supplier_id,
            'balance' => $sale->price,
            'type' => 'credit',
        ]);

        return 'done';
    }
}

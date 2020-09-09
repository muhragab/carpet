<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Products\Product;
use App\Models\Products\ProductTypes;
use App\Models\SalesMan;
use App\Models\SupplierPrice;
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
        $request->validate([
            'supplier_id' => 'required',
            'sale_man' => 'required',
            'inventorie_id' => 'required',
            'date' => 'required',
        ]);
        $data = $request->only([
            'supplier_id',
            'sale_man',
            'inventorie_id',
            'permission_number',
            'finalPrice',
            'priceFinal',
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

        $sale = Sale::create($final);

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

    public function getPrice(Request $request)
    {
        $getProduct = Product::where('id', $request->product_id)->first();
        $type = ProductTypes::where('id', $getProduct->type_id)->first();
        $price = SupplierPrice::where('supplier_id', $request->supplier_id)->where('product_id', $type->id)->first();

        return $price->price;
    }
}

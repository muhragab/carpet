<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\SalesMan;
use App\Traits\StoreProductBankTrait;
use Illuminate\Http\Request;

use App\Models\Purchases\SupplierAccount;
use App\Models\Sales\{BackSale, BackSaleItem, Sale, SaleItem};

class BackSaleController extends Controller
{

    use StoreProductBankTrait;

    public function permission_number()
    {
        return $oreder_number = BackSale::count() + 1;
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

        $sale = BackSale::create($final);

        $items = $request->items;

        foreach ($items as $item) {
            BackSaleItem::create([
                'sale_id' => $sale->id,
                'product_id' => $item['product_id'],
                'number' => $item['number'],
                'price' => $item['price'],
                'total_price' => $item['number'] * $item['price']
            ]);
            $this->storeProductBank($item['product_id'], $request['inventorie_id'], $item['number']);
        }

        $sale->price = BackSaleItem::where('sale_id', '=', $sale->id)->where('product_id', '=', $item['product_id'])->sum('total_price');
        $sale->save();

        SupplierAccount::create([
            'supplier_id' => $sale->supplier_id,
            'balance' => $sale->price,
            'type' => 'credit',
        ]);

        return 'done';
    }
}

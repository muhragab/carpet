<?php

namespace App\Http\Controllers;

use App\AccountStatement;
use App\Models\Products\Product;
use App\Models\Purchases\BackPurchase;
use App\Models\Purchases\BackPurchaseItem;
use App\Models\Purchases\Purchase;
use App\Models\Purchases\PurchaseItem;
use App\Models\Sales\BackSale;
use App\Models\Sales\BackSaleItem;
use App\Models\Sales\Sale;
use App\Models\Sales\SaleItem;
use App\Store;
use App\StoresProduct;
use Illuminate\Http\Request;

class ProductReportsController extends Controller
{
    public function storeReport()
    {
        $stores = Product::get();
        $data = array();
        foreach ($stores as $store) {
            $store['mainProduct'] = StoresProduct::where('product_id', $store->id)->sum('number');
            $store['purchase'] = PurchaseItem::where('product_id', $store->id)->sum('number');
            $store['purchaseBack'] = BackPurchaseItem::where('product_id', $store->id)->sum('number');
            $store['sale'] = SaleItem::where('product_id', $store->id)->sum('number');
            $store['saleBack'] = BackSaleItem::where('product_id', $store->id)->sum('number');
            if ($store['mainProduct'] != 0 || $store['purchase'] != 0 ||
                $store['purchaseBack'] != 0 || $store['sale'] != 0 || $store['saleBack'] != 0)
                $data[] = $store;
        }
        return view('mudir.store_report.index', compact('data'));
    }

    public function storeMainProductDetails($id)
    {
        $mainProducts = StoresProduct::where('store_id', $id)->get();

        return view('mudir.store_report.store_product', compact([
            'mainProducts'
        ]));
    }


    public function storePurchasesDetails($id)
    {
        $purchases = Purchase::where('inventorie_id', $id)->where('status', 2)->get();
        /*  $purchases = PurchaseItem::whereIn('purchase_id', $purchases_id)->get();*/
        return view('mudir.store_report.purchases', compact([
            'purchases'
        ]));
    }

    public function storePurchasesBackDetails($id)
    {
        $purchasesBack = BackPurchase::where('inventorie_id', $id)->get();
        return view('mudir.store_report.purchases_back', compact([
            'purchasesBack'
        ]));
    }


    public function storeSalesBackDetails($id)
    {
        $salesBack = BackSale::where('inventorie_id', $id)->get();
        return view('mudir.store_report.sales_back', compact([
            'salesBack'
        ]));
    }

    public function storeSalesDetails($id)
    {
        $sales = Sale::where('inventorie_id', $id)->where('status', 2)->get();
        return view('mudir.store_report.sales', compact([
            'sales'
        ]));
    }
}

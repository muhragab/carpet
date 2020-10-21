<?php

namespace App\Http\Controllers;

use App\AccountStatement;
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

class StoreReportsController extends Controller
{
    public function storeReport()
    {
        $stores = Store::get();
        $data = array();
        foreach ($stores as $store) {
            $store['mainProduct'] = StoresProduct::where('store_id', $store->id)->sum('number');
            $purchases = Purchase::where('inventorie_id', $store->id)->where('status', 2)->get('id');
            $store['purchase'] = PurchaseItem::whereIn('purchase_id', $purchases)->sum('number');
            $purchasesBack = BackPurchase::where('inventorie_id', $store->id)->get('id');
            $store['purchaseBack'] = BackPurchaseItem::whereIn('purchase_id', $purchasesBack)->sum('number');
            $sale = Sale::where('inventorie_id', $store->id)->where('status', 2)->get('id');
            $store['sale'] = SaleItem::whereIn('sale_id', $sale)->sum('number');
            $saleBack = BackSale::where('inventorie_id', $store->id)->get('id');
            $store['saleBack'] = BackSaleItem::whereIn('sale_id', $saleBack)->sum('number');
            $data[] = $store;
        }
        return view('mudir.store_report.index', compact('data'));
    }

    public function storeMainProductDetails($id)
    {
        $mainProducts = StoresProduct::where('product_id', $id)->get();

        return view('mudir.product_report.store_product', compact([
            'mainProducts'
        ]));
    }


    public function storePurchasesDetails($id)
    {
        $purchases = PurchaseItem::where('product_id', $id)->get();
        return view('mudir.product_report.purchases', compact([
            'purchases'
        ]));
    }

    public function storePurchasesBackDetails($id)
    {
        $purchasesBack = BackPurchaseItem::where('product_id', $id)->get();
        return view('mudir.product_report.purchases_back', compact([
            'purchasesBack'
        ]));
    }


    public function storeSalesBackDetails($id)
    {
        $salesBack = BackSaleItem::where('product_id', $id)->get();
        return view('mudir.product_report.sales_back', compact([
            'salesBack'
        ]));
    }

    public function storeSalesDetails($id)
    {
        $sales = SaleItem::where('product_id', $id)->get();
        return view('mudir.product_report.sales', compact([
            'sales'
        ]));
    }
}

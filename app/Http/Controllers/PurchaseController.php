<?php

namespace App\Http\Controllers;

use App\Models\Purchases\PurchaseItem;
use App\Traits\StoreProductBankTrait;
use Illuminate\Http\Request;

use App\Models\Purchases\Purchase;
use App\Models\Products\Product;

class PurchaseController extends Controller
{
    use StoreProductBankTrait;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $purchases = Purchase::get();
        return view('mudir.purchases.purchase.index')
            ->withPurchases($purchases);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $products = Product::get();
        return view('mudir.purchases.purchase.create')
            ->withProducts($products);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return $request->all();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Purchases\Purchase $purchase
     * @return \Illuminate\Http\Response
     */
    public function show(Purchase $purchase)
    {
        //dd($purchase);
        return view('mudir.purchases.purchase.show')
            ->withPurchase($purchase);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Purchases\Purchase $purchase
     * @return \Illuminate\Http\Response
     */
    public function edit(Purchase $purchase)
    {

        $PurchaseItem = PurchaseItem::where('purchase_id', $purchase->id)->first();
        $this->storeProductBank($PurchaseItem['product_id'], $purchase['inventorie_id'], $PurchaseItem['number']);
        $purchase->update(['status' => 2]);

        return redirect()->back();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \App\Purchases\Purchase $purchase
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Purchase $purchase)
    {

    }

    public function delete($purchase)
    {
        Purchase::where('id', $purchase)->delete();
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Purchases\Purchase $purchase
     * @return \Illuminate\Http\Response
     */
    public function destroy(Purchase $purchase)
    {

    }
}

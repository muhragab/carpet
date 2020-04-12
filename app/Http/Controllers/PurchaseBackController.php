<?php

namespace App\Http\Controllers;

use App\Models\Purchases\BackPurchase;
use Illuminate\Http\Request;

use App\Models\Purchases\Purchase;
use App\Models\Products\Product;

class PurchaseBackController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $purchases = BackPurchase::get();
        return view('mudir.purchases.back_purchase.index')
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
        return view('mudir.purchases.back_purchase.create')
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
    public function show($id)
    {
        $purchase = BackPurchase::where('id', $id)->first();
        //dd($purchase);
        return view('mudir.purchases.back_purchase.show')
            ->withPurchase($purchase);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Purchases\Purchase $purchase
     * @return \Illuminate\Http\Response
     */
    public function edit(BackPurchase $purchase)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \App\Purchases\Purchase $purchase
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, BackPurchase $purchase)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Purchases\Purchase $purchase
     * @return \Illuminate\Http\Response
     */
    public function destroy(BackPurchase $purchase)
    {
        //
    }
}

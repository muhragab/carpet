<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\StoreProductBank;
use Illuminate\Http\Request;

use App\Models\Products\Product;

class ProductController extends Controller
{
    public function getAll()
    {
        return Product::get();
    }

    public function getOne(Request $request)
    {
        return Product::find($request->id);
    }

    public function getCount(Request $request)
    {
        $StoreProductBank = StoreProductBank::where('store_id', $request->inventorie_id)->where('product_id', $request->product_id)->first();
        return $StoreProductBank == null ? 0 : $StoreProductBank->number;
    }
}

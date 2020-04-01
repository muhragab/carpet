<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
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
}

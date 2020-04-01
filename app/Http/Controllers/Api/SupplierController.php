<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Purchases\Supplier;

class SupplierController extends Controller
{
    public function getAll(Request $request)
    {
        if ($request->type == 'supplier') {
            return Supplier::where('is_supplier', '=', 1)->get();
        }

        if ($request->type == 'client') {
            return Supplier::where('is_client', '=', 1)->get();
        }

        return Supplier::get();
    }
}

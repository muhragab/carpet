<?php

namespace App\Http\Controllers;

use App\{Store, StoresProduct};
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class StoresProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $filterNullData = array_filter($request->rows, function ($x) {
            return $x['product_id'] != null && $x['number'] != null;
        });
        $lastOrder = StoresProduct::latest()->first();
        $newOrderNumber = $lastOrder->storeNumber + 1;
        foreach ($filterNullData as $data) {
            if ($data['number'] <= 0) {
                return back()->with('warning', 'يجب ان تكون القيمة اكبر من 0');
            }
            $store = Store::where('id', '=', $data['store_id'])->first();
            StoresProduct::create([
                'store_id' => $data['store_id'],
                'product_id' => $data['product_id'],
                'number' => $data['number'],
                'storeNumber' => $newOrderNumber,
            ]);
            $store->activityAdd('store:add:value');
        }
        //}

        return back()->with('success', 'تم اضافة الصنف الي هذا المخزن');
    }

    /**
     * Display the specified resource.
     *
     * @param StoresProduct $storesProduct
     * @return Response
     */
    public function show(StoresProduct $storesProduct)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param StoresProduct $storesProduct
     * @return Response
     */
    public function edit(StoresProduct $storesProduct)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param StoresProduct $storesProduct
     * @return Response
     */
    public function update(Request $request, StoresProduct $storesProduct)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param StoresProduct $storesProduct
     * @return Response
     */
    public function destroy(StoresProduct $storesProduct)
    {
        //
    }
}

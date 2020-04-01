<?php

namespace App\Http\Controllers;

use App\{Store, StoresProduct, StoreTransferLog};
use App\Models\Products\{Product};
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class StoreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {

        $stores = Store::get();
        return view('mudir.stores.index')
            ->withStores($stores);
    }

    public function addToStore($id)
    {
        $store = Store::where('id', $id)->first();
        $products = Product::get();
        $stores = Store::get();
        $logs = StoreTransferLog::where('store_to_id', '=', $store->id)
            ->where('acceptance', '=', 'pending')
            ->get();
        return view('mudir.stores.add_to_store')
            ->withStore($store)
            ->withStores($stores)
            ->withProducts($products)
            ->withLogs($logs);
    }

    public function showInStore($id)
    {
        $store = Store::where('id', $id)->first();
//        $products = Product::get();
//        $stores = Store::get();
//        $logs = StoreTransferLog::where('store_to_id', '=', $store->id)
//            ->where('acceptance', '=', 'pending')
//            ->get();

        $products = StoresProduct::where('store_id', $id)->groupBy(['product_id', 'store_id'])
            ->selectRaw('*, sum(number) as numbers')
            ->get();
        return view('mudir.stores.show_in_store')
            ->withStore($store)
            ->withProducts($products);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return view('mudir.stores.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        Store::create($request->only(['name']));
        return redirect()->route('stores.index')->with('success', 'تم اضافة المخزن');
    }

    /**
     * Display the specified resource.
     *
     * @param Store $store
     * @return Response
     */
    public function show(Store $store)
    {
        $products = Product::get();
        $stores = Store::get();
        $logs = StoreTransferLog::where('store_to_id', '=', $store->id)
            ->where('acceptance', '=', 'pending')
            ->get();

        return view('mudir.stores.show')
            ->withStore($store)
            ->withStores($stores)
            ->withProducts($products)
            ->withLogs($logs);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Store $store
     * @return Response
     */
    public function edit(Store $store)
    {
        return view('mudir.stores.edit')
            ->withStore($store);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Store $store
     * @return Response
     */
    public function update(Request $request, Store $store)
    {
        $store->update($request->only(['name']));
        return redirect()->route('stores.index')
            ->with('success', 'تم تحديث المخزن');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Store $store
     * @return Response
     */
    public function destroy(Store $store)
    {
        $store->delete();
        return redirect()->route('stores.index')
            ->with('success', 'تم حذف المخزن');
    }

    public function transformation(Request $request)
    {
        $filterNullData = array_filter($request->row, function ($x) {
            return $x['product_id'] != null && $x['number'] != null;
        });

        $orderNumber = StoreTransferLog::count() + 1;
        foreach ($filterNullData as $data) {
            $product_from_store = StoresProduct::where('store_id', '=', $request->store_from)
                ->where('id', '=', $data['product_id'])
                ->first();
            $product_to_store = StoresProduct::where('store_id', '=', $request->store_to)
                ->where('product_id', '=', $product_from_store->product_id)
                ->first();
            if ($product_from_store->number <= $data['number']) {
                return back()->with('warning', 'الصنف المطلوب غير متاح بالعدد المطلوب');
            }

            $product_from_store->number -= $data['number'];
            $product_from_store->save();

            StoreTransferLog::create([
                'store_from_id' => $request->store_from,
                'store_to_id' => $request->store_to,
                'product_id' => $product_from_store->product_id,
                'number' => $data['number'],
                'orderNumber' => $orderNumber,
                'transfer_date' => $request->transfer_date
            ]);
        }


        return back()->with('success', 'تم التحويل وفي انتظار المراجعة');
    }

    public function showSendStore($id)
    {
        $products = Product::get();
        $stores = Store::get();
        $store = Store::where('id', $id)->first();
        $logs = StoreTransferLog::where('store_from_id', '=', $id)
            /*->where('acceptance', '=', 'pending')*/
            ->get();

        return view('mudir.stores.show_from_store')
            ->withStore($store)
            ->withStores($stores)
            ->withProducts($products)
            ->withLogs($logs);
    }
    public function showToStore($id)
    {
        $store = Store::where('id', $id)->first();

        $products = Product::get();
        $stores = Store::get();
        $logs = StoreTransferLog::where('store_to_id', '=', $store->id)
            /*->where('acceptance', '=', 'pending')*/
            ->get();

        return view('mudir.stores.show_to_store')
            ->withStore($store)
            ->withStores($stores)
            ->withProducts($products)
            ->withLogs($logs);
    }

    public function transformationAcceptance(Request $request, StoreTransferLog $log, $acceptance)
    {
        $log->acceptance = $acceptance;
        $log->save();

        if ($acceptance == 'no') {
            $product_from_store = StoresProduct::where('store_id', '=', $log->store_from_id)
                ->where('product_id', '=', $log->product_id)
                ->first();

            $product_from_store->number += $log->number;
            $product_from_store->save();

            return back()->with('success', 'تم الرفض');
        }

        $product_to_store = StoresProduct::where('store_id', '=', $log->store_to_id)
            ->where('product_id', '=', $log->product_id)
            ->first();

        if (!$product_to_store) {
            StoresProduct::create([
                'store_id' => $log->store_to_id,
                'product_id' => $log->product_id,
                'number' => $log->number
            ]);
            return back()->with('success', 'تم تحويل');
        }

        $product_to_store->number += $request->number;
        $product_to_store->save();

        return back()->with('success', 'تم تحويل');
    }
}

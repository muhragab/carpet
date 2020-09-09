<?php

namespace App\Http\Controllers;

use App\Models\Purchases\Supplier;
use App\Models\SalesMan;
use Illuminate\Http\Request;

class SupplierController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $suppliers = Supplier::get();

        if ($request->has('is_supplier') || $request->has('is_client')) {
            $suppliers = Supplier::where($request->only(['is_supplier', 'is_client']))->get();
        }
        
        return view('mudir.purchases.suppliers.index')
            ->withSuppliers($suppliers);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $salesMen =SalesMan::get();
        return view('mudir.purchases.suppliers.create',compact(['salesMen']));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:suppliers',
        ]);

        if (!$request->has('is_supplier') && !$request->has('is_client')) {
            return back()->with('warning', 'برجاء اختيار الحساب الي مورد او عميل');
        }

        $data = $request->only([
            'name',
            'adress',
            'phone_number',
            'ground_number',
            'fax_number',
            'email',
            'is_supplier',
            'is_client',
            'status',
            'salesMan',
        ]);

        Supplier::create($data);

        return redirect()->route('supplier.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Purchases\Supplier  $supplier
     * @return \Illuminate\Http\Response
     */
    public function show(Supplier $supplier)
    {
        $credit = $supplier->account->where('type', '=', 'credit')->sum('balance');
        $deposit = $supplier->account->where('type', '=', 'deposit')->sum('balance');

        return view('mudir.purchases.suppliers.show')
            ->withSupplier($supplier)
            ->withCredit($credit)
            ->withDeposit($deposit);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Purchases\Supplier  $supplier
     * @return \Illuminate\Http\Response
     */
    public function edit(Supplier $supplier)
    {
        $salesMen =SalesMan::get();

        return view('mudir.purchases.suppliers.edit',compact(['salesMen']))
            ->withSupplier($supplier);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Purchases\Supplier  $supplier
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Supplier $supplier)
    {
        $request->validate([
            'name' => 'required|unique:suppliers,id,'.$supplier->id,
        ]);

        if (!$request->has('is_supplier') && !$request->has('is_client')) {
            return back()->with('warning', 'برجاء اختيار الحساب الي مورد او عميل');
        }

        $data = $request->only([
            'name',
            'adress',
            'phone_number',
            'ground_number',
            'fax_number',
            'email',
            'status',
            'salesMan',
        ]);
        $data['is_supplier'] = ($request->has('is_supplier')) ? 1 : 0;
        $data['is_client'] = ($request->has('is_client')) ? 1 : 0;

        $supplier->update($data);

        return back()->with('success', 'تم تحديث البيانات بنجاح');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Purchases\Supplier  $supplier
     * @return \Illuminate\Http\Response
     */
    public function destroy(Supplier $supplier)
    {
        $supplier->delete();
        return back()->with('success', 'تم الحذف بنجاح');
    }
}

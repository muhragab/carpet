<?php

namespace App\Http\Controllers;

use App\Models\Products\ProductTypes;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ProductTypesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $types = ProductTypes::get();
        return view('mudir.products.types.index')
            ->withTypes($types);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return view('mudir.products.types.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'name' => 'required',
        ]);
        ProductTypes::create([
            'name' => $request->name,
        ]);

        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param ProductTypes $productTypes
     * @return Response
     */
    public function show(ProductTypes $type)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param ProductTypes $productTypes
     * @return Response
     */
    public function edit(ProductTypes $type)
    {
        return view('mudir.products.types.edit')
            ->withType($type);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param ProductTypes $productTypes
     * @return Response
     */
    public function update(Request $request, ProductTypes $type)
    {
        $data = $request->only(['name']);
        $type->update($data);
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param ProductTypes $productTypes
     * @return Response
     */
    public function destroy(ProductTypes $type)
    {
        $type->delete();
        return back();
    }
}

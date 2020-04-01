<?php

namespace App\Http\Controllers;

use App\Models\Products\ProductColors;
use Illuminate\Http\Request;

class ProductColorsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $colors = ProductColors::get();
        return view('mudir.products.colors.index')
            ->withColors($colors);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('mudir.products.colors.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->only([
            'name'
        ]);

        ProductColors::create($data);

        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Products\ProductColors  $productColors
     * @return \Illuminate\Http\Response
     */
    public function show(ProductColors $productColors)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Products\ProductColors  $productColors
     * @return \Illuminate\Http\Response
     */
    public function edit(ProductColors $color)
    {
        return view('mudir.products.colors.edit')
            ->withColor($color);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Products\ProductColors  $productColors
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ProductColors $color)
    {
        $data = $request->only(['name']);
        $color->update($data);
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Products\ProductColors  $productColors
     * @return \Illuminate\Http\Response
     */
    public function destroy(ProductColors $color)
    {
        $color->delete();
        return back();
    }
}

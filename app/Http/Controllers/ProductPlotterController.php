<?php

namespace App\Http\Controllers;

use App\Models\Products\ProductPlotter;
use Illuminate\Http\Request;

class ProductPlotterController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $plotters = ProductPlotter::get();
        return view('mudir.products.plotters.index')
            ->withPlotters($plotters);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('mudir.products.plotters.create');
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

        ProductPlotter::create($data);

        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Products\ProductPlotter  $productPlotter
     * @return \Illuminate\Http\Response
     */
    public function show(ProductPlotter $productPlotter)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Products\ProductPlotter  $productPlotter
     * @return \Illuminate\Http\Response
     */
    public function edit(ProductPlotter $plotter)
    {
        return view('mudir.products.plotters.edit')
            ->withPlotter($plotter);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Products\ProductPlotter  $productPlotter
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ProductPlotter $plotter)
    {
        $data = $request->only(['name']);
        $plotter->update($data);
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Products\ProductPlotter  $productPlotter
     * @return \Illuminate\Http\Response
     */
    public function destroy(ProductPlotter $plotter)
    {
        $plotter->delete();
        return back();
    }
}

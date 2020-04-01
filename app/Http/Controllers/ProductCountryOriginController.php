<?php

namespace App\Http\Controllers;

use App\Models\Products\ProductCountryOrigin;
use Illuminate\Http\Request;

class ProductCountryOriginController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $countries = ProductCountryOrigin::get();
        return view('mudir.products.country.index')
            ->withCountries($countries);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('mudir.products.country.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->only(['name']);
        ProductCountryOrigin::create($data);
        return redirect()->route('country.index')->with('success', 'تم اضافة البلد الجديدة');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Products\ProductCountryOrigin  $country
     * @return \Illuminate\Http\Response
     */
    public function show(ProductCountryOrigin $country)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Products\ProductCountryOrigin  $country
     * @return \Illuminate\Http\Response
     */
    public function edit(ProductCountryOrigin $country)
    {
        return view('mudir.products.country.edit')
            ->withCountry($country);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Products\ProductCountryOrigin  $country
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ProductCountryOrigin $country)
    {
        $data = $request->only(['name']);
        $country->update($data);
        return redirect()->route('country.index')->with('success', 'تم تحديث البلد');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Products\ProductCountryOrigin  $country
     * @return \Illuminate\Http\Response
     */
    public function destroy(ProductCountryOrigin $country)
    {
        $country->delete();
        return redirect()->route('country.index')->with('success', 'تم حذف البلد');
    }
}

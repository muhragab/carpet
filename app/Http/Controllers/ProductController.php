<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Str;

use App\Models\Items\Category;
use App\Models\Products\{Product, ProductTypes, ProductColors, ProductPlotter, ProductCountryOrigin};
use Storage;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $products = Product::get();
        return view('mudir.products.products.index')
            ->withProducts($products);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $categories = Category::where('category_id', '=', null)->with(['children'])->get();
        $types = ProductTypes::get();
        $colors = ProductColors::get();
        $plotters = ProductPlotter::get();
        $countries = ProductCountryOrigin::get();

        return view('mudir.products.products.create')
            ->withCategories($categories)
            ->withTypes($types)
            ->withColors($colors)
            ->withPlotters($plotters)
            ->withCountries($countries);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'category_id' => 'required',
            // 'sub_category_id' => 'required',
            'type_id' => 'required',
            'name' => 'required',
            'sizes_length' => 'required',
            'sizes_width' => 'required',
        ]);

        $data = $request->only([
            'category_id',
            'sub_category_id',
            'type_id',
            'color_id',
            'plotter_id',
            'country_origin_id',
            'name',
            'sizes_length',
            'sizes_width',
            'average_demand_limit',
            'maximum_demand_limit',
            'price_meter',
        ]);


        // Uplode file
        if ($request->has('image_path')) {
            $file = $request->file('image_path');
            $path_file = 'photos/' . Str::random(32) . '.' . $file->getClientOriginalExtension();
            Storage::disk('local')->put($path_file, file_get_contents($file));

            $data['image_path'] = $path_file;
        }

        Product::create($data);

        return redirect()->route('products.index')->with('success', 'تم تعريف الصنف الجديد');
    }

    /**
     * Display the specified resource.
     *
     * @param Product $product
     * @return Response
     */
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Product $product
     * @return Response
     */
    public function edit(Product $product)
    {
        $categories = Category::where('category_id', '=', null)->with(['children'])->get();
        $types = ProductTypes::get();
        $colors = ProductColors::get();
        $plotters = ProductPlotter::get();
        $countries = ProductCountryOrigin::get();

        return view('mudir.products.products.edit')
            ->withProduct($product)
            ->withCategories($categories)
            ->withTypes($types)
            ->withColors($colors)
            ->withPlotters($plotters)
            ->withCountries($countries);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Product $product
     * @return Response
     */
    public function update(Request $request, Product $product)
    {
        $data = $request->only([
            'category_id',
            'name',
            'sizes_length',
            'sizes_width',
            'type_id',
            'color_id',
            'plotter_id',
            'country_origin_id',
            'average_demand_limit',
            'maximum_demand_limit',
            'price_meter',
        ]);

        // Uplode file
        if ($request->has('image_path')) {
            $file = $request->file('image_path');
            $path_file = 'photos/' . Str::random(32) . '.' . $file->getClientOriginalExtension();
            Storage::disk('local')->put($path_file, file_get_contents($file));
            $data['image_path'] = $path_file;
        } else {
            $data['image_path'] = $product->image_path;
        }

        $product->update($data);

        return redirect()->route('products.index')->with('success', 'تم تحديث الصنف');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Product $product
     * @return Response
     */
    public function destroy(Product $product)
    {
        $product->delete();
        return back();
    }
}

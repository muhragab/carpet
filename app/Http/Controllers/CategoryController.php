<?php

namespace App\Http\Controllers;

use App\Models\Items\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::where('category_id', '=', null)->with(['children'])->get();
        // return $categories;
        return view('mudir.items.categories.index')
            ->withCategories($categories);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::where('category_id', '=', null)->get();
        return view('mudir.items.categories.create')
            ->withCategories($categories);
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
            'category_id',
            'name'
        ]);
        Category::create($data);
        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Items\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Items\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit(Category $category)
    {
        $categories = Category::where('category_id', '=', null)->with(['children'])->get();
        return view('mudir.items.categories.edit')
            ->withCategories($categories)
            ->withCategory($category);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Items\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Category $category)
    {
        $category->update($request->only([
            'name'
        ]));
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Items\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {
        $category->delete();
        return back();
    }

    public function getSubCategory(Request $request)
    {
        $categories = Category::where('category_id', '=', $request->category_id)->get();
        
        $html = '<option value=>اختيار تصنيف فرعي</option>';
        foreach ($categories as $category) {
            $html .= '<option value="'.$category->id.'">'.$category->name.'</option>';
        }
        return $html;
    }
}

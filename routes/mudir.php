<?php

Route::get('/', function () {
    return view('mudir.home');
})->name('mudir.home');

Route::resource('categories', 'CategoryController');

Route::resource('products/types', 'ProductTypesController');
Route::resource('products/colors', 'ProductColorsController');
Route::resource('products/plotters', 'ProductPlotterController');
Route::resource('products/country', 'ProductCountryOriginController');
Route::resource('products', 'ProductController');


Route::resource('purchases/supplier', 'SupplierController');
Route::resource('purchases/purchase', 'PurchaseController');
Route::resource('purchases/back', 'PurchaseBackController');

Route::resource('sales/sales', 'SalesController');

Route::resource('user', 'UserController');

Route::resource('stores', 'StoreController');
Route::get('/show/in/store/{id}', 'StoreController@showInStore');
Route::get('/add/to/store/{id}', 'StoreController@addToStore');
Route::get('/show/store/send/{id}', 'StoreController@showSendStore');
Route::get('/show/to/send/{id}', 'StoreController@showToStore');
Route::post('stores/transformation', 'StoreController@transformation')->name('stores.transformation');
Route::get('stores/transformation/acceptance/{log}/{acceptance}', 'StoreController@transformationAcceptance')->name('stores.transformation.acceptance');

Route::resource('stores_product', 'StoresProductController');

Route::resource('accounts', 'AccountController');
Route::resource('accounts_statement', 'AccountStatementController');

Route::resource('activitys', 'ActivityController');
Route::resource('accountCategories', 'AccountCategoryController');
Route::resource('subAccountCategories', 'SubAccountCategoryController');
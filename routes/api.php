<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('/get-all-product', 'Api\ProductController@getAll');
Route::get('/get/product/one', 'Api\ProductController@getOne');
Route::get('/supplier/all', 'Api\SupplierController@getAll');
Route::get('/get-all-stores', 'Api\PurchaseController@stores');
Route::get('/permission/number', 'Api\PurchaseController@permission_number');

Route::post('/purchase/save', 'Api\PurchaseController@save');
Route::post('/sale/save', 'Api\SaleController@save');
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
Route::get('sales/permission/number', 'Api\SaleController@permission_number');
Route::get('back/sales/permission/number', 'Api\BackSaleController@permission_number');
Route::get('/get-all-sales-man', 'Api\SaleController@salesMen');
Route::post('/purchase/save', 'Api\PurchaseController@save');

Route::get('back/permission/number', 'Api\PurchaseBackController@permission_number');
Route::post('back/purchase/save', 'Api\PurchaseBackController@save');

Route::post('/sale/save', 'Api\SaleController@save');
Route::post('back/sale/save', 'Api\BackSaleController@save');
Route::get('/supplier/price', 'Api\SaleController@getPrice');
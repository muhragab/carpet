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
Route::get('purchases/purchase/delete/{id}', 'PurchaseController@delete')->name('purchase.delete');
Route::resource('purchases/back', 'PurchaseBackController');

Route::resource('sales/sales', 'SalesController');
Route::get('sales/sales/delete/{id}', 'SalesController@delete')->name('sales.delete');
Route::resource('sales/BackSales', 'SalesBackController');

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
Route::resource('salesMen', 'SalesManController');
Route::resource('subAccountCategories', 'SubAccountCategoryController');

Route::resource('supplierPrices', 'SupplierPriceController');

Route::get('supplier/report','SupplierReportsController@supplierReport')->name('supplier.report');
Route::get('report/supplier/details/{id}','SupplierReportsController@supplierDetails');
Route::get('report/supplier/creditors/{id}','SupplierReportsController@supplierCreditorDetails');
Route::get('report/supplier/debtor/{id}','SupplierReportsController@supplierDebtorDetails');
Route::get('report/supplier/purchases/back/{id}','SupplierReportsController@supplierPurchasesBackDetails');
Route::get('report/supplier/purchases/{id}','SupplierReportsController@supplierPurchasesDetails');
Route::get('report/supplier/sales/back/{id}','SupplierReportsController@supplierSalesBackDetails');
Route::get('report/supplier/sales/{id}','SupplierReportsController@supplierSalesDetails');
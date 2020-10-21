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
Route::get('/store/product/details/{id}/{store_id}', 'StoreController@showInStoreDetails');
Route::get('/add/to/store/{id}', 'StoreController@addToStore');
Route::get('/show/store/send/{id}', 'StoreController@showSendStore');
Route::get('/show/to/send/{id}', 'StoreController@showToStore');
Route::get('/show/product/details/sent/{id}/{store_id}', 'StoreController@showSendDetails');
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

Route::get('supplier/report', 'SupplierReportsController@supplierReport')->name('supplier.report');
Route::get('report/supplier/details/{id}', 'SupplierReportsController@supplierDetails');
Route::get('report/supplier/creditors/{id}', 'SupplierReportsController@supplierCreditorDetails');
Route::get('report/supplier/debtor/{id}', 'SupplierReportsController@supplierDebtorDetails');
Route::get('report/supplier/purchases/back/{id}', 'SupplierReportsController@supplierPurchasesBackDetails');
Route::get('report/supplier/purchases/{id}', 'SupplierReportsController@supplierPurchasesDetails');
Route::get('report/supplier/sales/back/{id}', 'SupplierReportsController@supplierSalesBackDetails');
Route::get('report/supplier/sales/{id}', 'SupplierReportsController@supplierSalesDetails');


Route::get('store/report', 'StoreReportsController@storeReport')->name('store.report');
Route::get('report/store/main/products/{id}', 'StoreReportsController@storeMainProductDetails');
Route::get('report/store/purchases/{id}', 'StoreReportsController@storePurchasesDetails');
Route::get('report/store/purchases/back/{id}', 'StoreReportsController@storePurchasesBackDetails');
Route::get('report/store/sales/back/{id}', 'StoreReportsController@storeSalesBackDetails');
Route::get('report/store/sales/{id}', 'StoreReportsController@storeSalesDetails');


Route::get('product/report', 'ProductReportsController@storeReport')->name('product.report');
Route::get('report/product/main/products/{id}', 'StoreReportsController@storeMainProductDetails');
Route::get('report/product/purchases/{id}', 'StoreReportsController@storePurchasesDetails');
Route::get('report/product/purchases/back/{id}', 'StoreReportsController@storePurchasesBackDetails');
Route::get('report/product/sales/back/{id}', 'StoreReportsController@storeSalesBackDetails');
Route::get('report/product/sales/{id}', 'StoreReportsController@storeSalesDetails');
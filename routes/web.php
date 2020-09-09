<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/migrate', function () {
    Artisan::call('migrate');
    return 'done';
});

Route::get('/viewclear', function () {
    Artisan::call('view:clear');
    return 'done';
});
Route::get('/cacheclear', function () {
    Artisan::call('cache:clear');    return 'done';
});
Route::get('/configclear', function () {
    Artisan::call('config:clear');    return 'done';

});
Route::get('logout', 'Auth\LoginController@logout');
Auth::routes();
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
//Route::post('register', 'Api\AuthController@register');
Route::group(['middleware' => 'cors'], function(){
    Route::post('login', 'Api\AuthController@login');
    Route::post('register', 'Api\UsuariosController@create');
    Route::post('all', 'Api\UsuariosController@index');
});
//Route::post('login', 'Api\AuthController@login');
Route::group(['middleware' => 'auth:api'], function () {
    Route::post('profile', 'Api\AuthController@profile');
});
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

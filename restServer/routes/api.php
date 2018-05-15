<?php
use App\Usuario;
use Illuminate\Http\Request;
use Illuminate\Http\Resources;
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
    Route::middleware('jwt.auth')->post('register', 'Api\UsuariosController@create');
    Route::get('all', 'Api\UsuariosController@index');
    Route::middleware('jwt.auth')->post('update','Api\UsuariosController@update');
    Route::middleware('jwt.auth')->post('borrar','Api\UsuariosController@destroy');
    Route::middleware('jwt.auth')->post('profile', 'Api\AuthController@profile');
    Route::middleware('jwt.auth')->post('nominas/crear','Api\NominaController@store');
    Route::middleware('jwt.auth')->post('nominas/ver-nomina','Api\NominaController@show');
});
//Route::post('login', 'Api\AuthController@login');
/*Route::group(['middleware' => 'auth:api'], function () {
    Route::post('profile', 'Api\AuthController@profile');
});*/
//Route::middleware('jwt.auth')->post('profile', 'Api\AuthController@profile');

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
    //Route::post('register', 'Api\UsuariosController@create');
    Route::middleware('jwt.auth')->post('register', 'Api\UsuariosController@create');
    Route::middleware('jwt.auth')->post('logout', 'Api\AuthController@logout');
    Route::get('all', 'Api\UsuariosController@index');
    Route::middleware('jwt.auth')->post('update','Api\UsuariosController@update');
    Route::middleware('jwt.auth')->post('borrar','Api\UsuariosController@destroy');
    Route::middleware('jwt.auth')->post('profile', 'Api\AuthController@profile');
    Route::middleware('jwt.auth')->post('nominas/crear','Api\NominaController@store');
    Route::post('nominas/ver-nomina','Api\NominaController@show');
    Route::post('nominas/cargar_fechas','Api\NominaController@index');
    Route::middleware('jwt.auth')->post('nominas/consultar_nomina','Api\NominaController@consultar');
    //Route::middleware('jwt.auth')->post('vacaciones/ver-vacaciones','Api\VacacionesController@show');
    Route::middleware('jwt.auth')->post('vacaciones/registrar-vacaciones','Api\VacacionesController@store');
    Route::middleware('jwt.auth')->post('vacaciones/ver-vacaciones','Api\VacacionesController@index');
    Route::middleware('jwt.auth')->post('inventario/articulos','Api\InventarioController@index');
    Route::middleware('jwt.auth')->post('inventario/crear','Api\InventarioController@store');
    Route::middleware('jwt.auth')->post('inventario/editar','Api\InventarioController@update');
    Route::middleware('jwt.auth')->post('inventario/borrar','Api\InventarioController@destroy');
    Route::middleware('jwt.auth')->post('inventario/buscar','Api\InventarioController@show');
    Route::post('inventario/exportar','Api\InventarioController@exportar');
});
//Route::post('login', 'Api\AuthController@login');
/*Route::group(['middleware' => 'auth:api'], function () {
    Route::post('profile', 'Api\AuthController@profile');
});*/
//Route::middleware('jwt.auth')->post('profile', 'Api\AuthController@profile');

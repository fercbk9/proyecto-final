<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Inventario;
use Illuminate\Http\Request;
use Illuminate\Validation\Rules\In;
use Validator;

use Illuminate\Support\Facades\DB;
class InventarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //Mostraremos todos los inventarios paginados.
        return response()->json([
           'articulos' => Inventario::all()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'codigo' => 'required',
            'descripcion' => 'required',
            'peso_unidad' => 'required',
            'cantidad_stock' => 'required',
            'precio' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }
        $input = $request->all();
        $inventario = DB::select("select * from inventarios where codigo = '" . $input['codigo'] . " '");
        if ($inventario != null) {
            return response()->json([
                'message-error' => 'Ya existe ese codigo de producto!'
            ], 200);
        }
        $inventario = new Inventario();
        $inventario->codigo = $input['codigo'];
        $inventario->descripcion = $input['descripcion'];
        $inventario->peso_unidad = $input['peso_unidad'];
        $inventario->cantidad_stock = $input['cantidad_stock'];
        $inventario->precio = $input['precio'];
        $inventario->save();
        return response()->json([
            'message' => "Articulo Creado $inventario->codigo"
        ], 200);
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Inventario  $inventario
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        //Exportaremos a excel


    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Inventario  $inventario
     * @return \Illuminate\Http\Response
     */
    public function edit(Inventario $inventario)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Inventario  $inventario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'codigo' => 'required',
            'descripcion' => 'required',
            'peso_unidad' => 'required',
            'cantidad_stock' => 'required',
            'precio' => 'required',
            'id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }
        $input = $request->all();

        $inventario = Inventario::query("Select * from inventarios where id = ".$input['id'])->find($input['id']);
        //dd($user);

        $cosas['descripcion'] = $input['descripcion'];
        $cosas['peso_unidad'] = $input['peso_unidad'];
        if($input['codigo'] != $inventario->value('codigo')) {
            $cosas['codigo'] = $input['codigo'];
        }
        $cosas['cantidad_stock'] = $input['cantidad_stock'];
        $cosas['precio'] = $input['precio'];


        $inventario->update($cosas);
        return response()->json([
            'message' => 'Articulo Modificado Correctamente',
            'articulo' => $inventario
        ], 200);


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Inventario  $inventario
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $input = $request->all();
        $id = $input['id'];
        $user = Inventario::query("select * from inventarios where id = '$id'")->find($id);

        $user->delete();
        return response()->json([
            'message' => 'Articulo Borrado Correctamente'
        ],200);
    }

}

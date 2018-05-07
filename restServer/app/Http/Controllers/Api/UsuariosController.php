<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Usuario;
use App\Http\Controllers\Api\AuthController as auth;
use Validator;

class UsuariosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Usuario::all());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nombre' => 'required',
            'apellidos' => 'required',
            'direccion' => 'required',
            'telefono' => 'required',
            'fecha_nacimiento' => 'required',
            'email' => 'required|email'

        ]);

        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 422);
        }

        $input = $request->all();

        $user = new Usuario();
        $user->nombre = $input['nombre'];
        $user->apellidos = $input['apellidos'];
        $user->direccion = $input['direccion'];
        $user->telefono = $input['telefono'];
        $user->fecha_nacimiento = $input['fecha_nacimiento'];
        $user->email = $input['email'];
        $user->password = bcrypt('123456');
        $user->save();
        //$token =  $user->createToken('f-erp')->accessToken;

        return response()->json([
            'message' => 'Usuario Creado Correctamente',
            'user' => $user
        ], 200);

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
            'nombre' => 'required',
            'apellidos' => 'required',
            'direccion' => 'required',
            'telefono' => 'required',
            'fecha_nacimiento' => 'required',
            'email' => 'required|email'
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 422);
        }

        $input = $request->all();
        $input['password'] = bcrypt('123456');
        //$user = User::create();
        $user = new Usuario();
        $user->save($input);
        //$token =  $user->createToken('f-erp')->accessToken;

        return response()->json([
            'message' => 'Usuario creado correctamente',
            'user' => $user
        ], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {


    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $input = $request->all();

        $user = Usuario::query("Select * from users where id = ".$input['id'])->find($input['id']);
        //dd($user);

        $cosas['nombre'] = $input['nombre'];
        $cosas['apellidos'] = $input['apellidos'];
        if($input['email'] != $user->value('email')) {
            $cosas['email'] = $input['email'];
        }
        $cosas['fecha_nacimiento'] = $input['fecha_nacimiento'];
        $cosas['direccion'] = $input['direccion'];
        $cosas['telefono'] = $input['telefono'];
        if(isset($input['password'])){
            $cosas['password'] = $input['password'];
        }
        $user->update($cosas);
        return response()->json([
            'message' => 'Usuario Modificado Correctamente',
            'user' => $user
        ], 200);



    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $input = $request->all();
        $id = $input['id'];
        $user = Usuario::query("select * from users where id = $id")->find($id);
        $user->delete();
        return response()->json([
            'message' => 'Usuario Borrado Correctamente'
                    ],200);
    }
}

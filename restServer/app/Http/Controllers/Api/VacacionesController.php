<?php

namespace App\Http\Controllers\Api;

use App\Vacaciones;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Barryvdh\DomPDF\Facade as PDF;
use Illuminate\Support\Facades\DB;
use Validator;
use DateTime;

class VacacionesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_empleado' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 422);
        }
        $input = $request->all();
        $user = User::query("select * from users where id = ".$input['id_empleado'])->find($input['id_empleado']);
        //verificamos  que existe el usuario
        if(empty($user)){
            return response()->json([
                'message-error' => 'no existe ese usuario'
            ], 200);
        }
        $vacaciones_validate = DB::select("select * from vacaciones where id_empleado = '" . $input['id_empleado'] . "'");
        if($vacaciones_validate == null){
            return response()->json([
                'message-error' => 'No hay vacaciones!'
            ], 200);
        }
        return response()->json([
           'vacaciones' => $vacaciones_validate
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
            'id_empleado' => 'required',
            'fecha_inicio' => 'required',
            'fecha_fin' => 'required'

        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 422);
        }
        $input = $request->all();
        $user = User::query("select * from users where id = ".$input['id_empleado'])->find($input['id_empleado']);
        //verificamos  que existe el usuario
        if(empty($user)){
            return response()->json([
                'message-error' => 'no existe ese usuario'
            ], 200);
        }
        $sql = "SELECT * from vacaciones where id_empleado = " . $input['id_empleado'] . " and (fecha_inicio = '" . $input['fecha_inicio'] . "' or fecha_fin = '" . $input['fecha_fin'] . "')";
        $vacaciones_validate = DB::select($sql);

        if($vacaciones_validate != null){
            return response()->json([
                'message-error' => 'Ya existe una de  esas fechas asignada!'
            ], 200);
        }
        $date1 = new DateTime($input['fecha_inicio']);
        $date2 = new DateTime($input['fecha_fin']);
        $diff = $date1->diff($date2);
        if($diff->days > $user->dias_restantes){
            return response()->json([
                "message-error" => "No puedes pedir tantos dias"
            ]);
        }

        $vacaciones = new Vacaciones();
        $vacaciones->id_empleado = $input['id_empleado'];
        $vacaciones->fecha_inicio = $input['fecha_inicio'];
        $vacaciones->fecha_fin = $input['fecha_fin'];
        $vacaciones->save();
        if($date1 == $date2){
            $user->dias_restantes = $user->dias_restantes - 1;
        }else {
            $user->dias_restantes = $user->dias_restantes - $diff->days;
        }
        $user->save();
        return response()->json([
            'vacaciones' => "Vacaciones asignadas! $user->name"
        ], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Vacaciones  $vacaciones
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_empleado' => 'required'

        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 422);
        }
        $input = $request->all();
        $user = User::query("select * from users where id = ".$input['id_empleado'])->find($input['id_empleado']);
        //verificamos  que existe el usuario
        if(empty($user)){
            return response()->json([
                'message-error' => 'no existe ese usuario'
            ], 200);
        }
        $vacaciones = DB::select("select * from vacaciones where id_empleado = ". $user->id);
        if(empty($vacaciones)){
            return response()->json([
                'message-error' => 'todavía no tiene vacaciones'
            ], 200);
        }
        return response()->json([
            'vacaciones' => $vacaciones
        ], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Vacaciones  $vacaciones
     * @return \Illuminate\Http\Response
     */
    public function edit(Vacaciones $vacaciones)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Vacaciones  $vacaciones
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Vacaciones $vacaciones)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Vacaciones  $vacaciones
     * @return \Illuminate\Http\Response
     */
    public function destroy(Vacaciones $vacaciones)
    {
        //
    }
}

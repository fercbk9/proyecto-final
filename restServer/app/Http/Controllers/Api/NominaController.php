<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Nomina;
use App\User;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade as PDF;
use Illuminate\Support\Facades\DB;
use Validator;

class NominaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
            'salario_base' => 'required',
            'fecha_nomina' => 'required',
            'horas_extra' => 'required',
            'paga_extra' => 'required'
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
        $nomina = new Nomina();
        $nomina->id_empleado = $input['id_empleado'];
        $nomina->salario_base = $input['salario_base'];
        $nomina->fecha_nomina = $input['fecha_nomina'];
        $nomina->horas_extra = $input['horas_extra'];
        $nomina->precio_hora_extra = $input['precio_hora_extra'];
        $nomina->seg_social = 0.04;
        $nomina->irpf = 0.07;
        $nomina->plus_convenio = 40;
        $nomina->paga_extra = $input['paga_extra'];
        $nomina->total = ($nomina->salario_base+($nomina->horas_extra*$nomina->precio_hora_extra)+$nomina->plus_convenio);
        $nomina->total = $nomina->total - (($nomina->total*$nomina->seg_social)+($nomina->total*$nomina->irpf));
        $nomina->total = $nomina->total + $nomina->paga_extra;
        $nomina->save();
        return response()->json([
            'message' => "Nomina Creada el total es de $nomina->total"
        ], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Nomina  $nomina
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_empleado' => 'required',
            'fecha_nomina' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 422);
        }
        $input = $request->all();
        //$nomina = Nomina::query("Select * From Nominas where id_empleado = $input[id_empleado] and fecha_nomina = '$input[fecha_nomina]'")->get();
        $user = User::query("select * from users where id = ".$input['id_empleado'])->find($input['id_empleado']);
        //verificamos  que existe el usuario
        if(empty($user)){
            return response()->json([
                'message-error' => 'no existe ese usuario'
            ], 200);
        }
        $nomina = DB::select("Select * From Nominas where id_empleado = $input[id_empleado] and fecha_nomina = '$input[fecha_nomina]'");

        //verificamos si la consulta ha recibido algún valor
        if(empty($nomina)){
            return response()->json([
                'message-error' => 'no existe esa nomina'
            ], 200);
        }
        $nomina = $nomina[0];
        $pdf = PDF::loadView('pdf', compact('nomina'),compact('user'));
        return $pdf->download("$user->nombre$user->apellidos-$nomina->fecha_nomina.pdf") ;
        /**/
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Nomina  $nomina
     * @return \Illuminate\Http\Response
     */
    public function edit(Nomina $nomina)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Nomina  $nomina
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Nomina $nomina)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Nomina  $nomina
     * @return \Illuminate\Http\Response
     */
    public function destroy(Nomina $nomina)
    {
        //
    }

}

<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Auth;
use Validator;
use JWTAuth;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nombre' => 'required',
            'apellidos' => 'required',
            'direccion' => 'required',
            'telefono' => 'required',
            'fecha_nacimiento' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'confirm_password' => 'required|same:password',

        ]);

        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 422);
        }

        $input = $request->all();
        $input['password'] = bcrypt($request->get('password'));
        if (!isset($input['cargo'])){
            $input['cargo'] = 'EMPLEADO';
        }
        $input['dias_restantes'] = 30;
        dd($input);
        //$user = User::create();
        $user = new User();
        $user->save($input);
        $token =  $user->createToken('f-erp')->accessToken;

        return response()->json([
            'token' => $token,
            'user' => $user
        ], 200);
    }

    public function login(Request $request)
    {


        if ( $token = JWTAuth::attempt($request->only('email', 'password'))) {

            $user = Auth::user();
            
            return response()->json([
                'token' => $token,
                'user' => $user
            ], 200);
        } else {
            return response()->json(['error' => 'Unauthorised'], 401);
        }
    }

    public function profile()
    {
        $user = Auth::user();
        return response()->json(compact('user'), 200);
        

    }
    public function  index(){
        return response()->json(User::all());
    }

    public function logout()
    {
        JWTAuth::invalidate();
        return response()->json([
            'status' => 'success',
            'msg' => 'Logged out Successfully.'
        ], 200);
    }



}

import { Injectable } from '@angular/core';
import { Http,Jsonp,Headers } from '@angular/http';
import  'rxjs/Rx';
import { logging } from 'selenium-webdriver';



@Injectable()
export class UsuariosService {
private usuario:any;
private headers:Headers = new Headers;
constructor(private _http:Http, private _jsonp:Jsonp) {
  this.headers.append('Content-Type', 'application/x-www-form-urlencoded');
 }

 getUsuario(){
   return this.usuario;
 }

login(username:string,password_intro:string)
{
  let user:any = {
    email: username,
    password: password_intro
  };

  
  return this._http.post("http://localhost:8000/api/login",user).map((data) => {
    this.usuario = {
      token: data.json().token,
      nombre: data.json().user.nombre,
      apellidos: data.json().user.apellidos,
      direccion: data.json().user.direccion,
      telefeno: data.json().user.telefono,
      fecha_nacimiento: data.json().user.fecha_nacimiento,
      email: data.json().user.email,
    }
    return data.json();

  },error => console.log(error)
  );
}

}
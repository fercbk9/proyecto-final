import { Injectable } from '@angular/core';
import { Http,Jsonp,Headers } from '@angular/http';
import  'rxjs/Rx';
import { logging } from 'selenium-webdriver';
import { Observable } from 'rxjs/Observable';


@Injectable()
export class UsuariosService  {
private usuario:any;
private headers:Headers;
constructor(private _http:Http, private _jsonp:Jsonp) {
  this.headers = new Headers({
    'Authorization': 'Bearer ' + localStorage.getItem('token'),
    'Accept': 'application/json'
});
  

 }

editar(empleado){
  this._http.post("http://localhost:8000/api/editar",empleado,{headers:this.headers}).map(data => {
    return data.json();
  });
}

 getUsuario(){
   return this._jsonp.post("http://localhost:8000/api/profile",{headers:this.headers}).map(data => {
     return data.json();
   });
 }

getAllUsers()
{
  return this._http.get("http://localhost:8000/api/all",{headers:this.headers}).map(data => {
    
    return data.json();
  });
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
      telefono: data.json().user.telefono,
      fecha_nacimiento: data.json().user.fecha_nacimiento,
      email: data.json().user.email,
    }
    localStorage.setItem('user',JSON.stringify(this.usuario));
    
    

    return data.json();

  },error => console.log(error)
  );
}

}







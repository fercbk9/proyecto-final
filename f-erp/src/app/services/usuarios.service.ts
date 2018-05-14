import { Injectable } from '@angular/core';
import { Http,Jsonp,Headers } from '@angular/http';
import  'rxjs/Rx';
import { logging } from 'selenium-webdriver';
import { Observable } from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { HttpRequest, HttpHandler, HttpEvent, HttpInterceptor} from '@angular/common/http';


@Injectable()
export class UsuariosService  {
private usuario:any;
private headers:Headers = new Headers();
constructor(private _http:Http, private httpCli:HttpClient) {
  this.headers.append("Content-Type","application/json");
  this.headers.append("Authorization","Bearer "+localStorage.getItem('token'));


 }
 intercept(request: HttpRequest, next: HttpHandler): Observable<HttpEvent> {
  let headers: any;
  // Si el usuario está logueado, de lo contrario no adjuntar estos headers
  // pues puede que el endpoint que estamos llamando es el Login o Register
  // los cuales no requerir que el usuario esté autenticado, sería estupido.
  if (localStorage.getItem('token')) {
      // Adjuntamos los headers a la petición
      headers = new HttpHeaders({
          'Authorization': 'Bearer ' + localStorage.getItem('token'),
          'Content-Type': 'application/json',
          'Accept': 'application/json'
      });
  }
  const cloneReq = request.clone({headers});

  return next.handle(cloneReq);
}
 borrar(id)
 {
   let empleado = {
      id: id
   }
   return this._http.post("http://localhost:8000/api/borrar",empleado,{headers:this.headers}).map(data =>{ return data.json()});
 }
editar(empleado)
{
  return this._http.post("http://localhost:8000/api/update",empleado,{headers:this.headers}).map(data => {
    return data.json();
  });
}

 getUsuario()
 {
   
   console.log(localStorage.getItem('token'));
   
  let headers = new HttpHeaders({
    'Authorization': 'Bearer ' + localStorage.getItem('token'),
    'Content-Type': 'application/json',
    'Accept': 'application/json'
});
  

  console.log(headers);
   return this.httpCli.post("http://localhost:8000/api/profile",{headers: headers});
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

alta(empleado)
{
  return this._http.post("http://localhost:8000/api/register",empleado,{headers:this.headers}).map(data => {return data.json()});
}

}

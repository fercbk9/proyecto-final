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
 intercept(request: HttpRequest<any>, next: HttpHandler): Observable<any> {
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
  let headers = new HttpHeaders({
    'Authorization': 'Bearer ' + localStorage.getItem('token'),
    'Content-Type': 'application/json',
    'Accept': 'application/json'
});
   let empleado = {
      id: id
   }
   return this.httpCli.post("http://localhost:8000/api/borrar",empleado,{headers:headers}).map(data =>{ return data});
 }
editar(empleado)
{
  let headers = new HttpHeaders({
    'Authorization': 'Bearer ' + localStorage.getItem('token'),
    'Content-Type': 'application/json',
    'Accept': 'application/json'
});
  return this.httpCli.post("http://localhost:8000/api/update",empleado,{headers:headers}).map(data => {
    return data;
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
fechas_minimas_maximas(){
  let headers = new HttpHeaders({
    'Authorization': 'Bearer ' + localStorage.getItem('token'),
    'Content-Type': 'application/json',
    'Accept': 'application/json'
});
  return this.httpCli.post("http://localhost:8000/api/nominas/cargar_fechas",{headers:headers}).map(data =>  {return data});
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
      id: data.json().user.id
    }
    localStorage.setItem('user',JSON.stringify(this.usuario));



    return data.json();

  },error => console.log(error)
  );
}

alta(empleado)
{
  let headers = new HttpHeaders({
    'Authorization': 'Bearer ' + localStorage.getItem('token'),
    'Content-Type': 'application/json',
    'Accept': 'application/json'
});
  return this.httpCli.post("http://localhost:8000/api/register",empleado,{headers:headers}).map(data => {return data});
}

verNomina(fecha:string,id:string)
{
  let headers = new HttpHeaders({
    'Authorization': 'Bearer ' + localStorage.getItem('token'),
    'Content-Type': 'application/json',
    'Accept': 'application/pdf'
});
let nomina:any = {
  fecha_nomina: fecha,
  id_empleado: id
}
  return this._http.post("http://localhost:8000/api/nominas/ver-nomina",nomina,{headers:this.headers}).map(data => data);
}

}

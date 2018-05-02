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


login(username:string,password:string)
{
  let user:any[] = [];
  user['email'] = username;
  user['password'] = password;
  
  return this._http.post("http://localhost:8000/api/login","email="+user['email']+"&password="+user['password']).map((data) => {
    
    return data.json();

  },error => console.log(error)
  );
}

}
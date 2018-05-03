import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { routerTransition } from '../router.animations';
import { UsuariosService} from '../services/usuarios.service';
@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.scss'],
    animations: [routerTransition()]
})
export class LoginComponent implements OnInit {
    email:string;
    password:string;
    mensaje;
    constructor(public router: Router, private us:UsuariosService) {}

    ngOnInit() {}

    onLoggedin() {
    this.us.login(this.email,this.password).subscribe((data) => {
        console.log(data);
        this.mensaje = data.user;
        if(this.mensaje.email != null)
        {
            localStorage.setItem('isLoggedin', 'true');
            localStorage.setItem('token',data.token);
            localStorage.setItem('id',data.user.id);
                
        }
        this.router.navigate(['/dashboard']);
    });

    

    

    }
}

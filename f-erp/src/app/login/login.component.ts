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
    year_minimo:number;
    year_maximo:number;
    years:number[] = [];
    constructor(public router: Router, private us:UsuariosService) {
        this.us.fechas_minimas_maximas().subscribe(data => {
            let fecha_minima = new Date(data['fecha_minima']);
            let fecha_maxima = new Date(data['fecha_maxima']);
            console.log(fecha_minima);
            
            this.year_minimo = fecha_minima.getFullYear();
            this.year_maximo = fecha_minima.getFullYear();
            if(this.year_minimo == this.year_maximo)
            this.years.push(this.year_minimo);
            else{
                for(let i = this.year_maximo; i >= this.year_minimo; i--){
                    this.years.push(i);
                }
            }
            localStorage.setItem('years',JSON.stringify(this.years));

        })
    }

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

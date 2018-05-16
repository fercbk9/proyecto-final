import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../../router.animations';
import { UsuariosService} from '../../services/usuarios.service';
@Component({
    selector: 'app-dashboard',
    templateUrl: './dashboard.component.html',
    styleUrls: ['./dashboard.component.scss'],
    animations: [routerTransition()]
})
export class DashboardComponent implements OnInit {

    empleado:any;
    model: any = 0;
    year_minimo:number;
    year_maximo:number;
    years:number[];
    constructor(private us:UsuariosService) {
        this.us.getUsuario().subscribe(data => {
            console.log(data);
            localStorage.setItem("cargo",data['user'].cargo);
            console.log(localStorage.getItem("cargo"));
            
            
        });
        this.us.fechas_minimas_maximas().subscribe(data => {
            let fecha_minima = new Date(data['fecha_minima']);
            let fecha_maxima = new Date(data['fecha_maxima']);
            
            this.year_minimo = fecha_minima.getFullYear();
            this.year_maximo = fecha_minima.getFullYear();
            if(this.year_minimo == this.year_maximo)
            this.years.push(this.year_minimo);
        })

    }

    ngOnInit() {


    }

}

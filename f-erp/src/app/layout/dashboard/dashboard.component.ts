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
    mes_elegido:string = "99";
    year_elegido:string
    years:number[] = [];
    constructor(private us:UsuariosService) {
        this.us.getUsuario().subscribe(data => {
            console.log(data);
            localStorage.setItem("cargo",data['user'].cargo);
            console.log(localStorage.getItem("cargo"));
            this.years = JSON.parse(localStorage.getItem('years'));
            this.year_elegido = this.years[0].toString();
            
            
            
        });


    }

    ngOnInit() {


    }

}

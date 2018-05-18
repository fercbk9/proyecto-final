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
    error:string;
    constructor(private us:UsuariosService) {
        this.us.getUsuario().subscribe(data => {
            console.log(data);
            localStorage.setItem("cargo",data['user'].cargo);
            localStorage.setItem("id_empleado",data['user'].id);
            console.log(localStorage.getItem("id_empleado"));
            
            console.log(localStorage.getItem("cargo"));
            this.years = JSON.parse(localStorage.getItem('years'));
            this.year_elegido = this.years[0].toString();
            
            
            
        });


    }

    ngOnInit() {


    }
    verNomina()
    {
    let fecha:string;
    this.error = ""
    if(this.year_elegido.length != 0)
    {
        fecha = this.year_elegido+"-";
    
    switch(this.mes_elegido){
        case '0': 
        fecha = fecha+"01";
        break;
        case '1': 
        fecha = fecha+"02";
        break;
        case '2': 
        fecha = fecha+"03";
        break;
        case '3': 
        fecha = fecha+"04";
        break;
        case '4': 
        fecha = fecha+"05";
        break;
        case '5': 
        fecha = fecha+"06";
        break;
        case '6': 
        fecha = fecha+"07";
        break;
        case '7': 
        fecha = fecha+"08";
        break;
        case '8': 
        fecha = fecha+"09";
        break;
        case '9': 
        fecha = fecha+"10";
        break;
        case '10': 
        fecha = fecha+"11";
        break;
        case '11': 
        fecha = fecha+"12";
        break;
    }
    //Mandamos para ver la nomina.
    console.log(fecha);
    
    this.us.verNomina(fecha,localStorage.getItem("id_empleado")).subscribe(data  => {
        console.log(data);
        if(data['message-error']){
            this.error = "No tienes nominas en ese mes"
        }
        
    });
}   
    }
}

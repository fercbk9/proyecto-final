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
    constructor(private us:UsuariosService) {
        this.us.getUsuario().subscribe(data => console.log(data))
    }

    ngOnInit() {


    }

}

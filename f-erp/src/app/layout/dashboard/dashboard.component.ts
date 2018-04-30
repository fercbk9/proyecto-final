import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../../router.animations';

@Component({
    selector: 'app-dashboard',
    templateUrl: './dashboard.component.html',
    styleUrls: ['./dashboard.component.scss'],
    animations: [routerTransition()]
})
export class DashboardComponent implements OnInit {
	nombre:string;
	email:string;
	
    constructor() {
      
    }

    ngOnInit() {}
	darAlta()
	{
		console.log("Hola "+ this.nombre + " tu correo es " + this.email);
	}
}

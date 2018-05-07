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
	nombre:string;
    email:string;
    apellidos:string;
    direccion:string;
    telefono:string;
    fecha:string;
    empleados:any[];
    edito:boolean = false;
    tipo = "Alta";
    constructor(private us:UsuariosService) {
      
    }

    ngOnInit() {
        this.getUsers();
        
    }
    editar(id)
    {   
        console.log(id);
        this.edito = true;
        this.nombre = this.empleados[id].nombre;
        this.apellidos = this.empleados[id].apellidos;
        this.email = this.empleados[id].email;
        this.direccion = this.empleados[id].direccion;
        this.telefono = this.empleados[id].telefono;
        this.fecha = this.empleados[id].fecha_nacimiento;
        this.tipo = "Modificar";
    }
	darAlta()
	{
        if (this.edito) {
            //Editamos 
        }else{
            //Damos de alta
        }
        this.edito = false;
        console.log("Hola "+ this.nombre + " tu correo es " + this.email);
        vaciamosCampos();
    }
    vaciamosCampos()
    {
        this.edito = false;
        this.nombre = "";
        this.apellidos = "";
        this.email = "";
        this.direccion = "";
        this.telefono = "";
        this.fecha = "";
        this.tipo = "Alta";
    }
    getUsers()
    {
        this.us.getAllUsers().subscribe(data => {
            this.empleados = data;
            console.log(data);
            
        });
    }
}

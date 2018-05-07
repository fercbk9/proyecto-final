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
    id:number;
    index:number;
    tipo = "Alta";
    constructor(private us:UsuariosService) {
        this.getUsers();
    }

    ngOnInit() {
        
        
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
        this.id = this.empleados[id].id;
        this.tipo = "Modificar";
    }
	darAlta()
	{
        if (this.edito) {
            
            let empleado = {
                nombre: this.nombre,
                apellidos: this.apellidos,
                email: this.email,
                fecha_nacimiento : this.fecha,
                direccion: this.direccion,
                telefono: this.telefono,
                id: this.id

            }
            this.us.editar(empleado).subscribe(data => console.log(data));

        }else{
            //Damos de alta
        }
        this.edito = false;
        console.log("Hola "+ this.nombre + " tu correo es " + this.email);
        this.vaciamosCampos();
        this.getUsers();
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
    borrar(){
        this.id = this.empleados[this.index].id;
        this.us.borrar(this.id).subscribe(data => console.log(data));
        setInterval(this.getUsers(),1500);
    }
}

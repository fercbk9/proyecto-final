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

    ok: string;
    year_elegidoA: string = '99';
    mes_elegidoA: any = '99';
    correcto: string;
    errorV: string;
    empleado:any;
    model: any = 0;
    mes_elegido:string = "99";
    year_elegido:string
    years:number[] = [];
    error:string;
    cargo:string;
    admin:boolean = false;
    empleadoElegido:string = '99';
    empleados:any[];
    fecha_v_fin:string = "";
    fecha_v_inicio:string = "";
    salario_base:string = "";
    horas_extra:string = "0";
    precio_hora_extra:string = "0";
    paga_extra:string = "";
    listado_vacaciones:boolean = false;
    vacaciones:any[];
    constructor(private us:UsuariosService) {
        this.us.getUsuario().subscribe(data => {
            console.log(data);
            localStorage.setItem("cargo",data['user'].cargo);
            localStorage.setItem("id_empleado",data['user'].id);
            this.years = JSON.parse(localStorage.getItem('years'));
            this.year_elegido = this.years[0].toString();
            this.cargo = localStorage.getItem("cargo");
            if(this.cargo == "ADMIN")
            this.admin = true;
            this.us.listarVacaciones(data['user'].id).subscribe(datas =>{
            
                if(datas['vacaciones'] == null){
                    this.vacaciones = [];
                    this.listado_vacaciones = false;
                }else{
                    this.vacaciones = datas['vacaciones'];
                    console.log(this.vacaciones);
                    this.listado_vacaciones = true;
                }
                
                
                
            });
    
            
        });
        this.us.getAllUsers().subscribe(data => {
            this.empleados = data;
            console.log(data);

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
    if(this.mes_elegido != "99"){
    
    this.us.consultarNomina(fecha,localStorage.getItem("id_empleado")).subscribe(data  => {
        console.log(data);
        if(data['message-error']){
            this.error = "No tienes nominas en ese mes"
        }
        if(this.error == "" || this.error == undefined){
            this.us.verNomina(fecha,localStorage.getItem('id_empleado')).subscribe(data => data);
        }
        
    });
    }
    else{
        this.error = "Elegir mes válido"
    }
    

}   
    }
    registrarNomina()
    {
        if(parseInt(this.salario_base) >= 900){
            let fecha:string;
            this.error = ""
            if(this.year_elegidoA.length != 0 && this.year_elegidoA != '99')
            {
                fecha = this.year_elegidoA+"-";
            
            switch(this.mes_elegidoA){
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
            fecha = fecha + "-01";

        
            if(this.empleadoElegido == '99')
            {
                this.error = "Elige empleado!";
                this.ok = "";
            }else
            {
                if(this.horas_extra.length != 0 && this.precio_hora_extra.length == 0)
                {
                    this.error = "Si hay horas extras, tienes que haber precio!";
                    this.ok = "";
                }else
                {
                    if(this.paga_extra.length != 0 && parseInt(this.paga_extra) < 1000)
                    {
                        this.error = "La paga tiene que ser mayor!"
                        this.ok = "";
                    }else
                    {
                        let nomina;
                        if(this.paga_extra.length == 0){
                                nomina = {
                                salario_base: this.salario_base,
                                id_empleado: this.empleadoElegido,
                                fecha_nomina: fecha,
                                horas_extra: this.horas_extra,
                                precio_hora_extra: this.precio_hora_extra,
                                paga_extra: "0"
                            }
                        }else{
                            nomina = {
                                salario_base: this.salario_base,
                                id_empleado: this.empleadoElegido,
                                fecha_nomina: fecha,
                                horas_extra: this.horas_extra,
                                precio_hora_extra: this.precio_hora_extra,
                                paga_extra: this.paga_extra
                            }
                        }

                        this.us.registrarNomina(nomina).subscribe(data => {
                            if(data['message-error'])
                            {
                                this.error = data['message-error']
                                this.ok = "";
                            }else{
                                this.ok = "Creada la Nomina Correctamente";
                                this.error = "";
                            }
                            
                        });
                    }
                }
            }
        }
        else
        {
            this.error = "Elegir fecha válida";
            this.ok = "";
        }
    }else{
        this.error = "Salario base no puede ser menor que 900€";
        this.ok = "";
    }
    }
    pidoVacaciones(){
        if(this.fecha_v_inicio.length > 0 && this.fecha_v_fin.length > 0)
        {
            let fecha_inicio = new Date(this.fecha_v_inicio);
            let fecha_fin = new Date(this.fecha_v_fin);
            if(fecha_inicio > fecha_fin){
                this.correcto = ""
                this.errorV = "Error en las fechas. Revisalas!";
            }else{
            this.us.pedirVacaciones(this.fecha_v_inicio,this.fecha_v_fin,localStorage.getItem("id_empleado")).subscribe(data => 
                {
                    if(data['message-error'])
                    {
                        this.correcto = ""
                        this.errorV = data['message-error'];
                        
                    }else
                    {
                        this.errorV = "";
                        this.correcto = "Vacaciones Asignadas Correctamente!"
                        this.us.listarVacaciones(localStorage.getItem('id_empleado')).subscribe(datas =>{
            
                            if(datas['vacaciones'] == null){
                                this.vacaciones = [];
                                this.listado_vacaciones = false;
                            }else{
                                this.vacaciones = datas['vacaciones'];
                                console.log(this.vacaciones);
                                this.listado_vacaciones = true;
                            }
                            
                            
                            
                        });

                    }
                    
                });
            }
        }else
        {
            this.errorV = "Error al introducir las fechas!"
            this.correcto = ""
        }
        
    }
}

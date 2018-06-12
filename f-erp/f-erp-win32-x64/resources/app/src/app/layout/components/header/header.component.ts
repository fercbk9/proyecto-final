import { Component, OnInit } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { TranslateService } from '@ngx-translate/core';
import { UsuariosService} from '../../../services/usuarios.service';
@Component({
    selector: 'app-header',
    templateUrl: './header.component.html',
    styleUrls: ['./header.component.scss',]
})
export class HeaderComponent implements OnInit {
    pushRightClass: string = 'push-right';
    user:any;
    nombre:string;
    apellidos:string;
    email:string;
    fecha:string;
    telefono:string;
    direccion:string;
    pass1:string;
    pass2:string;
    actualizado:boolean;
    msj:string;
    constructor(private translate: TranslateService, public router: Router, private us:UsuariosService) {

        this.translate.addLangs(['en', 'fr', 'ur', 'es', 'it', 'fa', 'de', 'zh-CHS']);
        this.translate.setDefaultLang('en');
        const browserLang = this.translate.getBrowserLang();
        this.translate.use(browserLang.match(/en|fr|ur|es|it|fa|de|zh-CHS/) ? browserLang : 'en');
        this.actualizado = false;
        this.user = JSON.parse(localStorage.getItem('user'));
        this.router.events.subscribe(val => {
            if (
                val instanceof NavigationEnd &&
                window.innerWidth <= 992 &&
                this.isToggled()
            ) {
                this.toggleSidebar();
            }
        });
    }

    ngOnInit() {}

    isToggled(): boolean {
        const dom: Element = document.querySelector('body');
        return dom.classList.contains(this.pushRightClass);
    }

    toggleSidebar() {
        const dom: any = document.querySelector('body');
        dom.classList.toggle(this.pushRightClass);
    }

    rltAndLtr() {
        const dom: any = document.querySelector('body');
        dom.classList.toggle('rtl');
    }

    onLoggedout() {
        localStorage.removeItem('isLoggedin');
        localStorage.removeItem('token');
        localStorage.removeItem('id_empleado');
    }

    changeLang(language: string) {
        this.translate.use(language);
    }
    cargamosPerfil(){
        this.nombre = this.user.nombre;
        this.apellidos = this.user.apellidos;
        this.direccion = this.user.direccion;
        this.fecha = this.user.fecha_nacimiento;
        this.telefono = this.user.telefono;
        this.email = this.user.email;
        this.actualizado = false;
    }
    changePass()
    {
        if(this.pass1.length >= 6){
        if(this.pass1 == this.pass2)
        {
            this.msj = null;
            let empleado = JSON.parse(localStorage.getItem('user'));
            empleado.password = this.pass1;
            console.log(empleado);
            this.us.editar(empleado).subscribe(data => {
                console.log(data);
                this.actualizado = true;
                
            });
            setTimeout(() => {
                
                this.pass1 = "";
                this.pass2 = "";
            },2500);
        }
        else
        {
            this.msj = "Las Contraseñas no coinciden."
            this.pass1 = "";
            this.pass2 = "";
        }
    }else{
        this.msj = "La longitud de la contraseña debe ser mayor a 5 caracteres."
        this.pass1 = "";
        this.pass2 = "";
    }
    }
}

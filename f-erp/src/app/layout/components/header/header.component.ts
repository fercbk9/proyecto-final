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
    constructor(private translate: TranslateService, public router: Router, private us:UsuariosService) {

        this.translate.addLangs(['en', 'fr', 'ur', 'es', 'it', 'fa', 'de', 'zh-CHS']);
        this.translate.setDefaultLang('en');
        const browserLang = this.translate.getBrowserLang();
        this.translate.use(browserLang.match(/en|fr|ur|es|it|fa|de|zh-CHS/) ? browserLang : 'en');
        
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
    }
}

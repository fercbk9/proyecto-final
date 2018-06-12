import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../../router.animations';
import { UsuariosService} from '../../services/usuarios.service';
import { log } from 'util';
import { Router } from '@angular/router';

@Component({
    selector: 'app-charts',
    templateUrl: './charts.component.html',
    styleUrls: ['./charts.component.scss'],
    animations: [routerTransition()]
})
export class ChartsComponent implements OnInit {

    codigo:string;
    descripcion:string;
    peso_unidad:string;
    cantidad:string;
    precio:string;
    tipo:string = "Alta";
    eliminado:boolean = false;
    alta:boolean = false;
    editado:boolean = false;
    index:number;
    edito:boolean = false;
    id:number;
    articulos:any[];
    cargado:boolean = false;
    cod_buscar:string = "";
    constructor(private us:UsuariosService, private _routes:Router) 
    {
        this.getArticulos();
    }
    darAlta()
	{
        if (this.edito) {

            let articulo = {
                codigo: this.codigo,
                descripcion: this.descripcion,
                peso_unidad: this.peso_unidad,
                cantidad_stock : this.cantidad,
                precio: this.precio,
                
                id: this.id

            }
            this.us.editarArticulos(articulo).subscribe(data => {
              console.log(data);
              this.editado = true;
            });

        }else{
            let articulo = {
                codigo: this.codigo,
                descripcion: this.descripcion,
                peso_unidad: this.peso_unidad,
                cantidad_stock : this.cantidad,
                precio: this.precio,
                
                id: this.id
            }
            this.us.altaArticulos(articulo).subscribe(data => {
              console.log(data);
              this.alta = true;
            });
        }
        this.edito = false;
        console.log("Articulo: "+ this.descripcion);
        this.vaciamosCampos();
        setTimeout(() => {
          this.getArticulos();
          this.editado = false;
          this.alta = false;
        },2000);

    }
    editar(id)
    {
        console.log(id);
        this.edito = true;
        this.codigo = this.articulos[id].codigo;
        this.descripcion = this.articulos[id].descripcion;
        this.peso_unidad = this.articulos[id].peso_unidad;
        this.cantidad = this.articulos[id].cantidad_stock;
        this.precio = this.articulos[id].precio;
        this.id = this.articulos[id].id;
        this.tipo = "Modificar";
        
    }
    borrar(){
        this.id = this.articulos[this.index].id;
        let articulo = {
            id: this.id
        }
        this.us.borrarArticulos(articulo).subscribe(data => {console.log(data);this.eliminado=true});
        setTimeout(() => {
          this.getArticulos();
          this.eliminado = false;
        },2500);
    }
    getArticulos(): any {

            this.us.listarArticulos().subscribe(data => {
                this.articulos = data['articulos'];
                console.log(data);
                this.cargado = true;
    
            });
        
    }
    vaciamosCampos()
    {
        this.edito = false;
        this.codigo = "";
        this.descripcion = "";
        this.peso_unidad = "";
        this.cantidad = "";
        this.precio = "";
        this.tipo = "Alta";
    }
    buscarArticulo()
    {
      if(this.cod_buscar != "")
      {
        let articulo = {
            codigo: this.cod_buscar
        }
        this.us.consultaArticulo(articulo).subscribe(data => {
            this.articulos = data['articulos'];
        });
      }else{
          this.getArticulos();
      }  
        
    }
    exportar()
    {
        //this.us.exportar().subscribe(data => console.log(data));
        //this._routes.navigate(['http://localhost:8000/inventario/exportar']);
    }
    ngOnInit() {}
}
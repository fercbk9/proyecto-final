<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Inventario extends Model
{
    protected $fillable = [
        'codigo', 'id', 'descripcion','peso_unidad','cantidad_stock','precio'
    ];
}

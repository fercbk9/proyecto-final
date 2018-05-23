<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vacaciones extends Model
{
    protected $table = "vacaciones";

    protected $fillable = [
        'id_empleado', 'fecha_inicio', 'fecha_fin'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'created_at','updated_at'
    ];

}

<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNominasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('nominas', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_empleado');
            $table->float('salario_base');
            $table->date('fecha_nomina');
            $table->float('horas_extra');
            $table->float('precio_hora_extra');
            $table->float('seg_social');
            $table->float('irpf');
            $table->float('total');
            $table->integer('paga_extra');
            $table->float('plus_convenio');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('nominas');
    }
}

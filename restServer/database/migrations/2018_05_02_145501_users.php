<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Users extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function(Blueprint $table)
        {
            $table->increments('id');
            $table->string('nombre',50);
            $table->string('apellidos',50);
            $table->string('direccion',200);
            $table->string('telefono',50);
            $table->string("cargo",15);
            $table->date('fecha_nacimiento',10);
            $table->string('email',50)->unique();
            $table->string('password',255);
            $table->integer("dias_restantes");
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}

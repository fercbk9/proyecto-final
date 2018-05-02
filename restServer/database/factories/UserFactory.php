<?php

use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(App\User::class, function (Faker $faker) {
    return [
        'nombre' => $faker->name,
        'apellidos' => $faker->lastName,
        'direccion' => $faker->address,
        'telefono' => $faker->phoneNumber,
        'fecha_nacimiento' => $faker->date('1997-5-12'),
        'email' => $faker->unique()->safeEmail,
        'password' => str_random(50), // secret
        'remember_token' => str_random(10),
    ];
});

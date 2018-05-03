<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Factories;
use Faker\Generator as Faker;
use App\User;
class UserTable extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(Faker $faker)
    {
        factory(User::class)->times(10)->create();


    }
}

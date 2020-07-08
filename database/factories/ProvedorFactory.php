<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Proveedor;
use Faker\Generator as Faker;

$factory->define(Proveedor::class, function (Faker $faker) {
    return [
        'nombre' => ucwords($faker->name),
        'nitproveedor' => $faker->unique()->randomNumber,
        'email' => $faker->unique()->email,
        'telefono' => $faker->phoneNumber,
        'direccion' => $faker->address,
        'digver' => $faker->randomDigit,
        'reprelegal' => $faker->userName,
        'contacto' => $faker->streetName,
        'cuenta' => $faker->creditCardNumber,
        'regimensimpli' => '0',
    ];
});

<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UserSeeder::class);
        $this->call(DependensTableSeeder::class);
        $this->call(TipocontratosTableSeeder::class);
        $this->call(ProveedoresTableSeeder::class);
        $this->call(RubrosTableSeeder::class);
        $this->call(MesejecucionsTableSeeder::class);
        $this->call(ConcargosTableSeeder::class);
        $this->call(DatosmaestrosTableSeeder::class);
    }
}

<?php

use Illuminate\Database\Seeder;

class TipocontratosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        App\Tipocontrato::create([

            'nombretipo' => ucwords('Licitacion Publica'),
        ]);
        
        App\Tipocontrato::create([

            'nombretipo' => ucwords('Seleccion Abreviada'),
        ]);

        App\Tipocontrato::create([

            'nombretipo' => ucwords('Concurso de Meritos'),
        ]);

        App\Tipocontrato::create([

            'nombretipo' => ucwords('Contratacion Directa'),
        ]);

        App\Tipocontrato::create([

            'nombretipo' => ucwords('Minima Cuantia'),
        ]);
    
    }
}

<?php

use Illuminate\Database\Seeder;

class DependensTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
               
        App\Dependencia::create([

            'nombredepen' => ucwords('Admistrativa'),
        ]);

        App\Dependencia::create([

            'nombredepen' => ucwords('Contratos'),
        ]);

        App\Dependencia::create([

            'nombredepen' => ucwords('Servicios Admin'),
        ]);

        App\Dependencia::create([

            'nombredepen' => ucwords('Comedores'),
        ]);

        App\Dependencia::create([

            'nombredepen' => ucwords('Cads'),
        ]);

        App\Dependencia::create([

            'nombredepen' => ucwords('Soga'),
        ]);

        App\Dependencia::create([

            'nombredepen' => ucwords('Tesoreria'),
        ]);

        App\Dependencia::create([

            'nombredepen' => ucwords('Tecnologia'),
        ]);

        App\Dependencia::create([

            'nombredepen' => ucwords('Contabilidad'),
        ]);

        App\Dependencia::create([

            'nombredepen' => ucwords('Gestion Documental'),
        ]);

        App\Dependencia::create([

            'nombredepen' => ucwords('Negocios Especiales'),
        ]);

        App\Dependencia::create([

            'nombredepen' => ucwords('Cartera'),
        ]);
    }
    
}

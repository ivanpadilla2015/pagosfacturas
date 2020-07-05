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

            'nombredepen' => strtoupper('Admistrativa'),
        ]);

        App\Dependencia::create([

            'nombredepen' => strtoupper('Contratos'),
        ]);

        App\Dependencia::create([

            'nombredepen' => strtoupper('Servicios Admin'),
        ]);

        App\Dependencia::create([

            'nombredepen' => strtoupper('Comedores'),
        ]);

        App\Dependencia::create([

            'nombredepen' => strtoupper('Cads'),
        ]);

        App\Dependencia::create([

            'nombredepen' => strtoupper('Soga'),
        ]);

        App\Dependencia::create([

            'nombredepen' => strtoupper('Tesoreria'),
        ]);

        App\Dependencia::create([

            'nombredepen' => strtoupper('Tecnologia'),
        ]);

        App\Dependencia::create([

            'nombredepen' => strtoupper('Contabilidad'),
        ]);

        App\Dependencia::create([

            'nombredepen' => strtoupper('Gestion Documental'),
        ]);

        App\Dependencia::create([

            'nombredepen' => strtoupper('Negocios Especiales'),
        ]);

        App\Dependencia::create([

            'nombredepen' => strtoupper('Cartera'),
        ]);
    }
    
}

<?php

use Illuminate\Database\Seeder;

class RubrosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        App\Rubro::create([

            'nombrerubro' => ucwords('SIN USO'),
            'codigo' => '0-00-00-00-000-000'
        ]);
        App\Rubro::create([

            'nombrerubro' => ucwords('PRODUCTOS LÁCTEOS Y OVOPRODUCTOS'),
            'codigo' => 'A-05-01-01-002-002'
        ]);

        App\Rubro::create([

            'nombrerubro' => ucwords('PRODUCTOS DE PANADERÍA'),
            'codigo' => 'A-05-01-01-002-003-04'
        ]);

        App\Rubro::create([

            'nombrerubro' => ucwords('OTROS PRODUCTOS ALIMENTICIOS N.C.P.'),
            'codigo' => 'A-05-01-01-002-003-09'
        ]);

        App\Rubro::create([

            'nombrerubro' => ucwords('PRODUCTOS DE PANADERIA (FRITOS)'),
            'codigo' => 'A-05-01-01-002-003-04'
        ]);

        App\Rubro::create([

            'nombrerubro' => ucwords('CARNE Y PRODUCTOS CÁRNICOS '),
            'codigo' => 'A-05-01-01-002-001-01'
        ]);

        App\Rubro::create([

            'nombrerubro' => ucwords('BEBIDAS NO ALCOHOLICAS'),
            'codigo' => 'A-05-01-01-002-004-04'
        ]);
        
        App\Rubro::create([

            'nombrerubro' => ucwords('PREPARACIONES Y CONSERVAS DE FRUTAS Y NUECES '),
            'codigo' => 'A-05-01-01-002-001-04'
        ]);

        App\Rubro::create([

            'nombrerubro' => ucwords('HORTALIZAS'),
            'codigo' => 'A-05-01-01-000-001-02'
        ]);

        App\Rubro::create([

            'nombrerubro' => ucwords('FRUTAS Y NUECES'), 
            'codigo' => 'A-05-01-01-000-001-03'
        ]);

        App\Rubro::create([

            'nombrerubro' => ucwords('RAÍCES Y TUBÉRCULOS COMESTIBLES RICOS EN ALMIDÓN O INULINA'),
            'codigo' => 'A-05-01-01-000-001-05'
        ]);

        App\Rubro::create([

            'nombrerubro' => ucwords('HUEVOS DE GALLINA O DE OTRAS AVES, CON CÁSCARA, FRESCOS  '),
            'codigo' => 'A-05-01-01-000-002-03'
        ]);

       

    }
}

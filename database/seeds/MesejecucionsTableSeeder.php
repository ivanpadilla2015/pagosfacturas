<?php

use Illuminate\Database\Seeder;

class MesejecucionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        App\Mesesejecucion::create([

            'numeral' => '10.1.2',
            'obligacion' => ucwords('Cumplir con el objeto del contrato'),
            'entregable' => 'garantía',
        ]);

        App\Mesesejecucion::create([

            'numeral' => '10.1.3',
            'obligacion' => ucwords('Cumplir con el objeto del contrato'),
            'entregable' => 'Cumplimiento',
        ]);
        App\Mesesejecucion::create([

            'numeral' => '10.1.4',
            'obligacion' => ucwords('Cumplir con el objeto del contratao'),
            'entregable' => 'Cumplir con las exigencias del supervisor',
        ]);
        App\Mesesejecucion::create([

            'numeral' => '10.1.5',
            'obligacion' => ucwords('Cumplir con el objeto del contratao'),
            'entregable' => 'Obrar con lealtad y buena fe',
        ]);
        App\Mesesejecucion::create([

            'numeral' => '10.1.6',
            'obligacion' => ucwords('Cumplir con el objeto del contratao'),
            'entregable' => 'Firmar actas de liquidación y recibos a satisfacción',
        ]);
        App\Mesesejecucion::create([

            'numeral' => '10.1.7',
            'obligacion' => ucwords('Cumplir con el objeto del contratao'),
            'entregable' => 'Cumplir con las condiciones del contrato según anexo 1',
        ]);
    }
}

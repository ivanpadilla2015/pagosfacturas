<?php

use Illuminate\Database\Seeder;

class DatosmaestrosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        App\Datosmaestro::create([

            'director' => ucwords('Teniente Coronel Ricardo Jerez Soto'),
            'cargo_director' => ucwords('Ordenador del Gasto'),
            'detalle1' => 'Con toda atención me permito enviar al señor Teniente Coronel Ricardo Jerez
                            Soto, el informe de supervisión No. 03 Del contrato No. 010-011-2020 Correspondiente al
                            primer pedido mayo 2020, de acuerdo con la siguiente información:',
            'detalle2' => 'Se recibieron los Mantenimientos acordados en el contrato sin ningún inconveniente.',
            'detalle3' => 'N/A',
            'detalle4' => 'N/A',
            'detalle5' => 'El servicio fue desarrollado por el personal asignado por la empresa sin novedad especial',
            'detalle6' => 'Ninguna'

        ]);
    }
}

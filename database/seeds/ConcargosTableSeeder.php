<?php

use Illuminate\Database\Seeder;

class ConcargosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        App\Concargo::create([

            'detalle_inter' => ucwords('No Aplica'),
            'con_cargo_a' => 'Alfm Reg. Norte'
             
         ]); 
        App\Concargo::create([

            'detalle_inter' => ucwords('Inter Administrativo No 25488 del 20 julio 2020'),
            'con_cargo_a' => 'Ejetcito'
        
        ]);

        
        
    }
}

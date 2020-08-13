<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Datosmaestro;

class Maestros extends Component
{
    public $director, $cargo_director, $presupuesto, $cargo_presupuesto;

    

    public function render()
    {
       
       return view('livewire.maestros');
    }

    public function buscar()
    {
        $dm = Datosmaestro::findOrFail(1);
        $this->director = $dm->director;
        $this->cargo_director = $dm->cargo_director;
        $this->presupuesto = $dm->presupuesto;
        $this->cargo_presupuesto = $dm->cargo_presupuesto;
       
    }

    public function store()
    {
        $dm = Datosmaestro::findOrFail(1);
        $dm->director = $this->director;
        $dm->cargo_director = $this->cargo_director;
        $dm->presupuesto = $this->presupuesto;
        $dm->cargo_presupuesto = $this->cargo_presupuesto;
        $dm->save();
        $this->emit('alert', ['type'=> 'success', 'message' => 'Actualizado Correctamente']);
       
    }
}

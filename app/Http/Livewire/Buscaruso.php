<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Uso_rubro;
use Livewire\WithPagination;

class Buscaruso extends Component
{
    use WithPagination;
    public $searchuso, $usos;
    
    public function render()
    {
      return view('livewire.buscaruso',['result' => Uso_rubro::where('codigo_uso', 'LIKE', '%' . trim($this->searchuso) . '%')->paginate(3)]);
    }
}

<?php

namespace App\Http\Livewire;
use App\Proveedor;
use App\Contrato;
use App\Factura;
use Livewire\Component;

class Consulpro extends Component
{
   
    public $proved, $proveedor_id, $data, $facts;
    public  $verMode = false;

    public function render()
    {
        $this->proved = Proveedor::all();
       
        return view('livewire.consulpro');
    }

    public function consul($id)
    {
        
        $this->data = Proveedor::findOrFail($id);

    }

    public function buscarfac($id)
    {
        $this->facts = Contrato::findOrFail($id);
    }
}

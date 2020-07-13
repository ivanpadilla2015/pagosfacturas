<?php

namespace App\Http\Livewire;
use App\Pago;
use Livewire\Component;

class Pagonumero extends Component
{
    public $contrato_id, $contra, $pago_id;

    public function render()
    {
        $this->contra = Pago::orderBy('id', 'desc')->get();
        return view('livewire.pagonumero');
    }

    public function consulcon($id)
    {
        //$this->resetInputsC();
        if ($id) {
            $this->data = Pago::findOrFail($id);
            $this->proveedor_id = $this->data->proveedor_id;
        }
        
    }
}

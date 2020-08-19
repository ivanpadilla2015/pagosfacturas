<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Pago;

class Editarpago extends Component
{
    public $contra, $data;
    public function render()
    {
        $this->contra = Pago::orderBy('id', 'desc')->get();
        return view('livewire.editarpago');
    }

    public function consulpago($id)
    {
        //$this->resetInputsC();
        if ($id) {
            $this->data = Pago::findOrFail($id);
            //$this->proveedor_id = $this->data->proveedor_id;

        }
        
    }

    public function editencabe()
    {

    }

    public function editdeta()
    {
        
    }
}

<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Contrato;
use App\Pago;
use Livewire\WithPagination;

class Pagosdeuncontrato extends Component
{
    use WithPagination;
    public $contra, $data, $contrato_id, $pagos;
    public function render()
    {
        $this->contra = Contrato::orderBy('numcontrato', 'desc')->get();
        return view('livewire.pagosdeuncontrato');
    }

    public function consulcon($id)
    {
        //$this->resetInputsC();
        if ($id) {
            $this->data = Contrato::findOrFail($id);
            $this->pagos = Pago::where('contrato_id', $id)->get();

        }
        
    }
}

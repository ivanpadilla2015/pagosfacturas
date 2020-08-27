<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Contrato;
use App\Pago;
use Livewire\WithPagination;

class Pagosdeuncontrato extends Component
{
    use WithPagination;
    public $contra, $data, $contrato_id, $pagos, $fechaini, $fechafin;
    public function render()
    {
        $this->contra = Contrato::orderBy('numcontrato', 'desc')->get();
        return view('livewire.pagosdeuncontrato');
    }

    public function consulcon($id)
    {
        //$this->resetInputsC();fecha_pago
        $this->validate([
            'fechaini' => 'required',
            'fechafin' => 'required',
           
               
           ]);    
        if ($id) {
            $this->data = Contrato::findOrFail($id);
            $this->pagos = Pago::where('contrato_id', $id)
                                ->where('fecha_pago', '>=', $this->fechaini)
                                ->where('fecha_pago', '<=', $this->fechafin)
                                ->get();

        }
        
    }
}

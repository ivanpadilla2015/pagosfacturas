<?php

namespace App\Http\Livewire;
use App\Pago;
use Livewire\Component;
use PDF;

class Pagonumero extends Component
{
    public $contrato_id, $contra, $pago_id, $data, $pdf1;

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
            //$this->proveedor_id = $this->data->proveedor_id;

        }
        
    }

    public function Pdfxnumeropago()
    {
        
        //$user = User::findOrFail($request->input('id'));
        $this->pdf1= PDF::loadView('reportes.pdf_pago_num');
        $this->pdf1->stream();
        
    }
}

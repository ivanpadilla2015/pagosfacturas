<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\contrato;
use App\Rubrocontrato;
use App\Rubroprin;
use App\Pago;
use App\Facturadeta;

class Informesuministro extends Component
{
    public $numcontrato, $data=null, $rubpri, $rubroprin_id, $codi_rub, $datosrubro, $datopago,
            $datofac;

    public function render()
    {
        return view('livewire.informesuministro');
    }

    public function consulcontra()
    {
        $this->validate([
            'numcontrato' =>'required',
        ]);
        $this->data = Contrato::where('numcontrato', $this->numcontrato)->first();
        if ($this->data) {
            $this->datosrubro =  Rubrocontrato::where('contrato_id', $this->data->id )->get();
            $this->rubpri = Rubroprin::orderBy('nombre_rubro', 'asc')->get();
            $info = $this->data->sum_conse+1;
            $this->datopago =  Pago::where('sum_conse', $info)->get();
            $this->datofac =  Facturadeta::where('sum_conse', $info)->get();

        }else
        {
            $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No existe']);
        }
        
       
    }

}

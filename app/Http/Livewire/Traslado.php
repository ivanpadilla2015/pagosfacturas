<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Contrato;
use App\Rubrocontrato;

class Traslado extends Component
{
    public $numcontrato, $data=null, $datosrubro, $rubro_d, $rubro_a, $valortraslado;

    public function render()
    {
        return view('livewire.traslado');
    }

    public function consulcontra()
    {
        $this->validate([
            'numcontrato' =>'required',
        ]);
        $this->data = Contrato::where('numcontrato', $this->numcontrato)->first();
        $this->datosrubro =  Rubrocontrato::where('contrato_id', $this->data->id )->get();
        //dd($this->data);
        
    }

    public function store()
    {
        $rubro1 =  Rubrocontrato::findOrFail($this->rubro_d);
        $rubro1->saldo = $rubro1->saldo - $this->valortraslado;
        $rubro1->save();

        $rubro2 =  Rubrocontrato::findOrFail($this->rubro_a);
        $rubro2->saldo = $rubro2->saldo + $this->valortraslado;
        $rubro2->save();
        $this->emit('alert', ['type'=> 'success', 'message' => 'Operacion Realizada Correctamente']);
        $this->resetInput();

    }

    public function resetInput()
    {
        $this->numcontrato = null;
        $this->data = null;
        $this->datosrubro = null;
        $this->rubro_d = null;
        $this->rubro_a = null;
    }
}

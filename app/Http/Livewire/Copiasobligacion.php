<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Contrato;
use App\Obligacion;

class Copiasobligacion extends Component
{
    public $numcontrato, $numcontratop, $data=null, $datap=null;
    public $updateMode = false, $dato_obli, $dato_oblip, $totalr = 0;

    public function render()
    {
        return view('livewire.copiasobligacion');
    }

    public function consulcontra()
    {
        $this->validate([
            'numcontrato' =>'required',
        ]);
        $this->data = Contrato::where('numcontrato', $this->numcontrato)->first();
        if($this->data)
        {
            $this->dato_obli = Obligacion::where('contrato_id', $this->data->id)->get();
            $this->totalr = $this->dato_obli->count();
            if ($this->totalr < 1) {
                $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No tiene Obligaciones']); 
                $this->resetInput();
            }
        }            
        else
        {
            $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No existe']); 
        }
    }

    public function consulcontrapara()
    {
        $this->validate([
            'numcontrato' =>'required',
        ]);
        $this->datap = Contrato::where('numcontrato', $this->numcontratop)->first();
        if($this->datap)
        {
            $this->dato_oblip = Obligacion::where('contrato_id', $this->datap->id)->get();
            if ($this->dato_oblip->count() > 0) {
                $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato ya tiene Obligaciones']); 
                $this->resetInput();
            }else
            {
                $this->updateMode = true;
            } 
        }            
        else
        {
            $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No existe']); 
        }
    }

    public function confirmacion()
    {
       
        foreach ($this->dato_obli as $value) {
            Obligacion::create([
                'numeral' =>  $value->numeral,
                'obligacion_deta' => ucwords($value->obligacion_deta),
                'entregable' =>  ucwords($value->entregable),
                'contrato_id' => $this->datap->id
              ]);        
           
        }
        
        $this->emit('alert', ['type'=> 'success', 'message' => 'Copiados Correctamente']);
        $this->resetInput();
    }

    public function resetInput()
    {
        $this->numcontrato = null;
        $this->numcontratop = null;
        $this->data = null;
        $this->datap = null;
        $this->dato_obli = null;
        $this->updateMode = false;
    }

}

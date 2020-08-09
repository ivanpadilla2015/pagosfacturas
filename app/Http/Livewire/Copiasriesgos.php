<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Contrato;
use App\Riesgo;

class Copiasriesgos extends Component
{
    public $numcontrato, $numcontratop, $data=null, $datap=null;
    public $updateMode = false, $dato_ries, $dato_riesp, $totalr = 0;
    
    public function render()
    {
        return view('livewire.copiasriesgos');
    }

    public function consulcontra()
    {
        $this->validate([
            'numcontrato' =>'required',
        ]);
        $this->data = Contrato::where('numcontrato', $this->numcontrato)->first();
        if($this->data)
        {
            $this->dato_ries = Riesgo::where('contrato_id', $this->data->id)->get();
            $this->totalr = $this->dato_ries->count();
            if ($this->totalr < 1) {
                $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No tiene riesgos']); 
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
            $this->dato_riesp = Riesgo::where('contrato_id', $this->datap->id)->get();
            if ($this->dato_riesp->count() > 0) {
                $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato ya tiene Riesgos']); 
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
       
        foreach ($this->dato_ries as $value) {
            Riesgo::create([
                'tipo' => ucwords($value->tipo),
                'descripcion' => ucwords($value->descripcion),
                'tratamiento' =>  ucwords($value->tratamiento),
                'responsable' => ucwords($value->responsable),
                'periodicidad' => ucwords($value->periodicidad),
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
        $this->dato_ries = null;
        $this->updateMode = false;
    }

}

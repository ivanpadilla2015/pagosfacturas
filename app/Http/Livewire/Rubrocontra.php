<?php

namespace App\Http\Livewire;
use App\Contrato;
use App\Rubroprin;
use App\Rubrocontrato;
use Livewire\Component;

class Rubrocontra extends Component
{
    public $numcontrato, $data=null, $rubpri, $rubroprin_id, $codi_rub, $datosrubro;
    public function render()
    {
        return view('livewire.rubrocontra');
    }

    public function consulcontra()
    {
        $this->validate([
            'numcontrato' =>'required',
        ]);
        $this->data = Contrato::where('numcontrato', $this->numcontrato)->first();
        $this->datosrubro =  Rubrocontrato::where('contrato_id', $this->data->id )->get();
        $this->rubpri = Rubroprin::orderBy('nombre_rubro', 'asc')->get();
       
    }

    public function colocacodigo($id)
    {
        $nom = Rubroprin::findOrFail($id);
        $this->codi_rub = $nom->codigo_rubro;
    }

    public function agragarrubro()
    {
        Rubrocontrato::create([
            'contrato_id' => $this->data->id,
            'rubroprin_id' => $this->rubroprin_id
        ]);   
        
        
        $this->datosrubro=  Rubrocontrato::where('contrato_id', $this->data->id )->get();

        $this->emit('alert', ['type'=> 'success', 'message' => 'Creado Correctamente']);
        $this->resetInput();
    }

    public function resetInput()
    {
      /* $this->numcontrato = null;
       $this->data = null;
       $this->rubpri;
       $this->rubroprin_id;
       $this->codi_rub;*/
    }

}

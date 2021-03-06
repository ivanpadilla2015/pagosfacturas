<?php

namespace App\Http\Livewire;
use App\Contrato;
use App\Rubroprin;
use App\Rubrocontrato;
use Livewire\Component;

class Rubrocontra extends Component
{
    public $numcontrato, $data=null, $rubpri, $rubroprin_id, $codi_rub, $datosrubro,$valorrubro;
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
        if ($this->data) {
            $this->datosrubro =  Rubrocontrato::where('contrato_id', $this->data->id )->get();
            $this->rubpri = Rubroprin::orderBy('nombre_rubro', 'asc')->get();
        }else
        {
            $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No existe']);
        }
        
       
    }

    public function colocacodigo($id)
    {
        $nom = Rubroprin::findOrFail($id);
        $this->codi_rub = $nom->codigo_rubro;
    }

    public function agragarrubro()
    {
        $this->validate([
            'rubroprin_id' =>'required|integer|not_in:0',
        ]);
        
        Rubrocontrato::create([
            'contrato_id' => $this->data->id,
            'rubroprin_id' => $this->rubroprin_id,
            'valorrubro' => $this->valorrubro,
            'saldo' => $this->valorrubro
        ]);   
        
        
        $this->datosrubro=  Rubrocontrato::where('contrato_id', $this->data->id )->get();

        $this->emit('alert', ['type'=> 'success', 'message' => 'Creado Correctamente']);
        $this->resetInput();
    }

    public function resetInput()
    {
      /* $this->numcontrato = null;
       $this->data = null;
       $this->rubpri;*/
       $this->rubroprin_id= null;
       $this->valorrubro = null;
       $this->codi_rub = null;
    }

    public function destroy($id)
    {
        if ($id) {
            $record = Rubrocontrato::findOrFail($id);
            $record->delete();
            $this->datosrubro =  Rubrocontrato::where('contrato_id', $this->data->id )->get();
            $this->emit('alert', ['type'=> 'success', 'message' => 'Eliminado Correctamente']);
            $this->resetInput();
                        
        }
        
    }

    public function cancel()
    {
        
        $this->resetInput();
        return redirect()->to('/admin');
    }


}

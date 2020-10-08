<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Contrato;
use App\Inforsumini;

class Verinformes extends Component
{
    public $numcontrato, $data=null, $selected_id;
    public $fechainfo, $corresponde_periodo, $mes_ejecucion;

    public function render()
    {
        return view('livewire.verinformes');
    }

    public function consulcontra()
    {
        $this->validate([
            'numcontrato' =>'required',
        ]);
        $this->data = Contrato::where('numcontrato', $this->numcontrato)->first();
        if (empty($this->data)) {

            $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No existe']); 
            $this->resetInput();
            
        }else
        {
            if ($this->data->inforsuminis->count() < 1) {
                $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No Tiene Informes']); 
                $this->resetInput();
            }
        }
    }

    public function editdeta($id)
    {
        $record = Inforsumini::findOrFail($id);
        $this->selected_id = $id;
        $this->fechainfo = $record->fechainfo;
        $this->corresponde_periodo = $record->corresponde_periodo;
        $this->mes_ejecucion = $record->mes_ejecucion;
        

    }

    public function updatedeta()
    {
        
         if ($this->selected_id) {
            $record = Inforsumini::findOrFail($this->selected_id);
            $record->update(['fechainfo' => $this->fechainfo, 'mes_ejecucion' => $this->mes_ejecucion,
                    'corresponde_periodo' => $this->corresponde_periodo]);   
            $this->emit('alert', ['type'=> 'success', 'message' => 'Actualizado Correctamente']);    
            $this->data = Contrato::findOrFail($this->data->id);         
        }   
    }

    
    public function resetInput()
    {
        $this->data = null;
        $this->numcontrato = null;
        $this->fechainfo = null;
        $this->corresponde_periodo = null;
        $this->mes_ejecucion = null;
        
    }

    public function destroy()
    {
        $this->emit('alert', ['type'=> 'error', 'message' => 'Metodo no Autorizado']); 
        
    }
}

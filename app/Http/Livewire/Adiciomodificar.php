<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Contrato;
use App\Adicion;

class Adiciomodificar extends Component
{
    public $numcontrato, $data=null, $selected_id;
    public $fechaadicion, $registroadicion, $valoradicion, $newplazoejecucion ;

    public function render()
    {
        return view('livewire.adiciomodificar');
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
            if ($this->data->adicions->count() < 1) {
                $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No Tiene Adiciones']); 
                $this->resetInput();
            }
        }
    }

    public function editdeta($id)
    {
        $record = Adicion::findOrFail($id);
        $this->selected_id = $id;
        $this->registroadicion = $record->registroadicion;
        $this->fechaadicion = $record->fechaadicion;
        $this->valoradicion = $record->valoradicion;
        $this->newplazoejecucion = $record->newplazoejecucion;

    }

    public function updatedeta()
    {
        
         if ($this->selected_id) {
            $record = Adicion::findOrFail($this->selected_id);
            $record->update(['registroadicion' => $this->registroadicion, 'fechaadicion' => $this->fechaadicion,
                    'valoradicion' => $this->valoradicion, 'newplazoejecucion' => $this->newplazoejecucion]);   
            $this->emit('alert', ['type'=> 'success', 'message' => 'Actualizado Correctamente']);    
            $reg = Contrato::findOrFail($this->data->id);
            $reg->newplazoejecucion = $this->newplazoejecucion;
            $reg->save();
            $this->data = Contrato::findOrFail($this->data->id);         
        }   
    }

    
    public function resetInput()
    {
        $this->data = null;
        $this->numcontrato = null;
        $this->registroadicion = null;
        $this->fechaadicion = null;
        $this->valoradicion = null;
        $this->newplazoejecucion = null;

    }
        
}

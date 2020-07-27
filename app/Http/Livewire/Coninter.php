<?php

namespace App\Http\Livewire;
use App\Concargo;
use Livewire\Component;
use Livewire\WithPagination;

class Coninter extends Component
{
    use WithPagination;
    public $detalle_inter, $con_cargo_a, $selected_id, $updateMode;

    public function render()
    {
        return view('livewire.coninter',[ 'data' => Concargo::orderBy('id', 'desc')->paginate(5)]);
    }

    private function resetInput()
    {
        $this->detalle_inter = null;
        $this->con_cargo_a = null;
        
    }

    public function store()
    {
        $this->validate([
            'detalle_inter' => 'required|min:5',
            'con_cargo_a' => 'required|min:5',
        ]);       
        Concargo::create([
            'detalle_inter' => ucwords($this->detalle_inter),
            'con_cargo_a' => $this->con_cargo_a
        ]);        
        //ucwords — Convierte a mayúsculas el primer caracter de cada palabra de una cadena
        $this->emit('alert', ['type'=> 'success', 'message' => 'Creado Correctamente']);
        $this->resetInput();
    }

    public function edit($id)
    {
        $record = Concargo::findOrFail($id);  
        $this->selected_id = $id;
        $this->detalle_inter = $record->detalle_inter;
        $this->con_cargo_a = $record->con_cargo_a;
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
            'selected_id' => 'required|numeric',
            'detalle_inter' => 'required|min:5',
            'con_cargo_a' => 'required|min:5',
            
        ]); 
         if ($this->selected_id) {
            $record = Concargo::find($this->selected_id);
            $record->update(['detalle_inter' => ucwords($this->detalle_inter), 'con_cargo_a' => $this->con_cargo_a]);   
            $this->emit('alert', ['type'=> 'success', 'message' => 'Actualizado Correctamente']);    
            $this->resetInput();
            $this->detalle_inter = null;
            $this->updateMode = false;
           
        }   
     }

     public function destroy($id)
    {
        if ($id) {
            $record = Concargo::where('id', $id);
            $record->delete();
            $this->emit('alert', ['type'=> 'success', 'message' => 'Eliminado Correctamente']);
            $this->resetInput();
            $this->updateMode = false;
            
        }
     }
}

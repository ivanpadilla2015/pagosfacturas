<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Dependencia as Dependen;
use Livewire\WithPagination;

class Dependencia extends Component
{
    use WithPagination;
    public $nombredepen, $selected_id;
    public $updateMode = false;

    public function render()
    {
        $data = Dependen::all();
        return view('livewire.dependencia', [ 'data' => Dependen::orderBy('id', 'desc')->paginate(5)]);
    }
    private function resetInput()
    {
        $this->nombredepen = null;
        
    }

    public function store()
    {
        $this->validate([
            'nombredepen' => 'required|min:5',
        ]);       
        Dependen::create([
            'nombredepen' => ucwords($this->nombredepen)
        ]);        
        //ucwords — Convierte a mayúsculas el primer caracter de cada palabra de una cadena
        $this->emit('alert', ['type'=> 'success', 'message' => 'Creado Correctamente']);
        $this->resetInput();
    }

    public function edit($id)
    {
        $record = Dependen::findOrFail($id);  
        $this->selected_id = $id;
        $this->nombredepen = $record->nombredepen;
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
            'selected_id' => 'required|numeric',
            'nombredepen' => 'required|min:5'
            
        ]); 
         if ($this->selected_id) {
            $record = Dependen::find($this->selected_id);
            $record->update(['nombredepen' => ucwords($this->nombredepen)]);   
            $this->emit('alert', ['type'=> 'success', 'message' => 'Actualizado Correctamente']);    
            $this->resetInput();
            $this->updateMode = false;
           
        }   
     }

     public function destroy($id)
    {
        if ($id) {
            $record = Dependen::where('id', $id);
            $record->delete();
            $this->emit('alert', ['type'=> 'success', 'message' => 'Eliminado Correctamente']);
            $this->resetInput();
            $this->updateMode = false;
            
        }
     }
}

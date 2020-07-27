<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use App\Rubro;

class Usos extends Component
{
    use WithPagination;

    public $nombrerubro, $codigo, $selected_id,  $updateMode = false;

    public function render()
    {
       return view('livewire.usos', [ 'data' => Rubro::orderBy('id', 'desc')->paginate(5)]);
    }

    private function resetInput()
    {
        $this->nombrerubro = null;
        $this->codigo = null;
        
    }

    public function store()
    {
        $this->validate([
            'nombrerubro' => 'required|min:5',
            'codigo' => 'required|min:5',
        ]);       
        Rubro::create([
            'nombrerubro' => ucwords($this->nombrerubro),
            'codigo' => $this->codigo
        ]);        
        //ucwords — Convierte a mayúsculas el primer caracter de cada palabra de una cadena
        $this->emit('alert', ['type'=> 'success', 'message' => 'Creado Correctamente']);
        $this->resetInput();
    }

    public function edit($id)
    {
        $record = Rubro::findOrFail($id);  
        $this->selected_id = $id;
        $this->nombrerubro = $record->nombrerubro;
        $this->codigo = $record->codigo;
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
            'selected_id' => 'required|numeric',
            'nombrerubro' => 'required|min:5',
            'codigo' => 'required|min:5',
            
        ]); 
         if ($this->selected_id) {
            $record = Rubro::find($this->selected_id);
            $record->update(['nombrerubro' => ucwords($this->nombrerubro), 'codigo' => $this->codigo]);   
            $this->emit('alert', ['type'=> 'success', 'message' => 'Actualizado Correctamente']);    
            $this->resetInput();
            $this->updateMode = false;
           
        }   
     }

     public function destroy($id)
    {
        if ($id) {
            $record = Rubro::where('id', $id);
            $record->delete();
            $this->emit('alert', ['type'=> 'success', 'message' => 'Eliminado Correctamente']);
            $this->resetInput();
            $this->updateMode = false;
            
        }
     }
}

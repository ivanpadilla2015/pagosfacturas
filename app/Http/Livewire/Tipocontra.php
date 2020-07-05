<?php

namespace App\Http\Livewire;
use App\Tipocontrato;
use Livewire\Component;
use Livewire\WithPagination;

class Tipocontra extends Component
{
    use WithPagination;
    public $nombretipo, $selected_id;
    public $updateMode = false;

    public function render()
    {
        return view('livewire.tipocontra', [ 'data' => Tipocontrato::orderBy('id', 'desc')->paginate(5)]);
    }
    private function resetInput()
    {
        $this->nombretipo = null;
        
    }

    public function store()
    {
        $this->validate([
            'nombretipo' => 'required|min:5',
        ]);       
        Tipocontrato::create([
            'nombretipo' => ucwords($this->nombretipo)
        ]);        
        //ucwords — Convierte a mayúsculas el primer caracter de cada palabra de una cadena
        $this->emit('alert', ['type'=> 'success', 'message' => 'Creado Correctamente']);
        $this->resetInput();
    }

    public function edit($id)
    {
        $record = Tipocontrato::findOrFail($id);  
        $this->selected_id = $id;
        $this->nombretipo = $record->nombretipo;
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
            'selected_id' => 'required|numeric',
            'nombretipo' => 'required|min:5'
            
        ]); 
         if ($this->selected_id) {
            $record = Tipocontrato::find($this->selected_id);
            $record->update(['nombretipo' => ucwords($this->nombretipo)]);   
            $this->emit('alert', ['type'=> 'success', 'message' => 'Actualizado Correctamente']);    
            $this->resetInput();
            $this->updateMode = false;
           
        }   
     }

    public function destroy($id)
    {
        if ($id) {
            $record = Tipocontrato::findOrFail($id);
            $record->delete();
            $this->emit('alert', ['type'=> 'success', 'message' => 'Eliminado Correctamente']);
            $this->resetInput();
            $this->updateMode = false;
            
        }
     }




}

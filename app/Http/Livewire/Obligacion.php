<?php

namespace App\Http\Livewire;
use App\Contrato;
use App\Obligacion as Obligaci;
use Livewire\Component;
use Livewire\WithPagination;

class Obligacion extends Component
{
    use WithPagination;
    public $numcontrato, $data=null, $numeral, $obligacion_deta, $entregable, $contrato_id;
    public $updateMode = false, $dato_obli, $selected_id ;
    
    public function render()
    {   
        return view('livewire.obligacion');
    }

    public function consulcontra()
    {
        $this->validate([
            'numcontrato' =>'required',
        ]);
        $this->data = Contrato::where('numcontrato', $this->numcontrato)->first();
        $this->dato_obli = Obligaci::where('contrato_id', $this->data->id)->get();
    }

    public function store()
    {
        $this->validate([
            'obligacion_deta' =>'required',
            'entregable' => 'required'
        ]);       
        $new =Obligaci::create([
            'numeral' => $num = empty($this->numeral)? '': $this->numeral,
            'obligacion_deta' => ucwords($this->obligacion_deta),
            'entregable' =>  ucwords($this->entregable),
            'contrato_id' => $this->data->id
          ]);        
        //ucwords — Convierte a mayúsculas el primer caracter de cada palabra de una cadena
        $this->dato_obli = Obligaci::where('contrato_id', $this->data->id)->get();
        $this->emit('alert', ['type'=> 'success', 'message' => 'Creado Correctamente']);
        $this->resetInput();
    }

    public function edit($id)
    {
        $record = Obligaci::findOrFail($id);  
        $this->selected_id = $id;
        $this->numeral = $record->numeral;
        $this->obligacion_deta = $record->obligacion_deta;
        $this->entregable = $record->entregable;
        $this->contrato_id = $record->contrato_id;
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
            'obligacion_deta' =>'required',
            'entregable' => 'required'
        ]); 
         if ($this->selected_id) {
            $record = Obligaci::find($this->selected_id);
            $record->update(['numeral' =>  $num = empty($this->numeral)? '': $this->numeral,'obligacion_deta' => ucwords($this->obligacion_deta), 
                            'entregable' => ucwords($this->entregable), 'contrato_id' => $this->data->id]);   
            $this->dato_obli = Obligaci::where('contrato_id', $this->data->id)->get();
            $this->emit('alert', ['type'=> 'success', 'message' => 'Actualizado Correctamente']);   
            $this->resetInput();
            $this->updateMode = false;
           
        }   
     }

     public function destroy($id)
    {
        if ($id) {
            $record = Obligaci::where('id', $id);
            $record->delete();
            $this->dato_obli = Obligaci::where('contrato_id', $this->data->id)->get();
            $this->emit('alert', ['type'=> 'success', 'message' => 'Eliminado Correctamente']);
            $this->resetInput();
            $this->updateMode = false;
            
        }
     }

     public function resetInput()
     {
         $this->numeral = null;
         $this->obligacion_deta = null;
         $this->entregable = null;
         $this->contrato_id = null;
     }
}

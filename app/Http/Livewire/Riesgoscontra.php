<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Contrato;
use App\Riesgo;

class Riesgoscontra extends Component
{
    public $numcontrato, $data=null, $tipo, $descripcion, $tratamiento,  $responsable, $periodicidad, $contrato_id;
    public $updateMode = false, $dato_ries, $selected_id;
    
    public function render()
    {
        return view('livewire.riesgoscontra');
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
        }            
        else
        {
            $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No existe']); 
        }
    }

    public function store()
    {
        $this->validate([
            'descripcion' =>'required',
            'tratamiento' => 'required',
            'responsable' => 'required',
        ]);       
        $new = Riesgo::create([
            'tipo' => ucwords($this->tipo),
            'descripcion' => ucwords($this->descripcion),
            'tratamiento' =>  ucwords($this->tratamiento),
            'responsable' => ucwords($this->responsable),
            'periodicidad' => ucwords($this->periodicidad),
            'contrato_id' => $this->data->id
          ]);        
        //ucwords — Convierte a mayúsculas el primer caracter de cada palabra de una cadena
        $this->dato_ries = Riesgo::where('contrato_id', $this->data->id)->get();
        $this->emit('alert', ['type'=> 'success', 'message' => 'Creado Correctamente']);
        $this->resetInput();
    }

    public function edit($id)
    {
        $record = Riesgo::findOrFail($id);  
        $this->selected_id = $id;
        $this->tipo = $record->tipo;
        $this->descripcion = $record->descripcion;
        $this->tratamiento = $record->tratamiento;
        $this->responsable = $record->responsable;
        $this->periodicidad = $record->periodicidad;
        $this->contrato_id = $record->contrato_id;
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
            'descripcion' =>'required',
            'tratamiento' => 'required',
            'responsable' => 'required',
        ]);  
         if ($this->selected_id) {
            $record = Riesgo::find($this->selected_id);
            $record->update(['tipo' => ucwords($this->tipo), 'descripcion' => ucwords($this->descripcion), 'tratamiento' =>  ucwords($this->tratamiento),
                            'responsable' => ucwords($this->responsable), 'periodicidad' => ucwords($this->periodicidad), 
                            'contrato_id' => $this->data->id]);   
            $this->dato_ries = Riesgo::where('contrato_id', $this->data->id)->get();
            $this->emit('alert', ['type'=> 'success', 'message' => 'Actualizado Correctamente']);   
            $this->resetInput();
            $this->updateMode = false;
           
        }   
     }

     public function destroy($id)
     {
         if ($id) {
             $record = Riesgo::where('id', $id);
             $record->delete();
             $this->dato_ries = Riesgo::where('contrato_id', $this->data->id)->get();
             $this->emit('alert', ['type'=> 'success', 'message' => 'Eliminado Correctamente']);
             $this->resetInput();
             $this->updateMode = false;
             
         }
      }

    public function resetInput()
    {
        $this->tipo = null;
        $this->descripcion = null;
        $this->tratamiento = null;
        $this->responsable = null;
        $this->periodicidad = null;
        $this->contrato_id = null;
    }

}

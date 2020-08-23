<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Pago;
use App\Dependencia;
use App\Contrato;
use App\Rubroprin;
use App\Facturadeta;

class Editarpago extends Component
{
    public $contra, $data, $contradato, $lisusos = array(), $fechafac, $dependencia_id, $uso_rubro_id,
            $depen, $pago_id, $selected_id;
    public function render()
    {
        $this->depen = Dependencia::all();
        $this->contra = Pago::orderBy('id', 'desc')->get();
        return view('livewire.editarpago');
    }

    public function consulpago($id)
    {
        //$this->resetInputsC();
        if ($id) {
            $this->lisusos = array();
            $this->data = Pago::findOrFail($id);
            $this->contradato = Contrato::findOrFail($this->data->contrato_id);
            foreach ($this->contradato->rubrocontratos as $value) {
                $rprin  = Rubroprin::findOrFail($value->rubroprin_id);        
                foreach ($rprin->uso_rubros as  $uso) {
                    array_push($this->lisusos, ['id' => $uso->id, 'nombre_uso' => $uso->codigo_uso.' - '.substr($uso->nombre_uso,0,40),'id_prin' => $rprin->id ]); 
                }
            }
        }
        
    }

    public function editencabe()
    {

    }

    public function editdeta($id)
    {
        $record = Facturadeta::findOrFail($id);
        $this->selected_id = $id;
        $this->fechafac = $record->fechafac;
        $this->dependencia_id = $record->dependencia_id;
        $this->uso_rubro_id = $record->uso_rubro_id;
        
    }

    public function updatedeta()
    {
        /*$this->validate([
            'selected_id' => 'required|numeric',
            'nombredepen' => 'required|min:5'
            
        ]); */
         if ($this->selected_id) {
            $record = Facturadeta::findOrFail($this->selected_id);
            $record->update(['fechafac' => $this->fechafac, 'dependencia_id' => $this->dependencia_id,
                    'uso_rubro_id' => $this->uso_rubro_id]);   
            $this->emit('alert', ['type'=> 'success', 'message' => 'Actualizado Correctamente']);    
            $this->data = Pago::findOrFail($this->data->id);         
        }   
    }

    public function cancel()
    {
         $this->resetInputs();
    }

    public function resetInputs()
    {
        $this->contra = null;
        $this->data = null;
        $this->contradato = null;
        $this->lisusos = array();
        $this->fechafac = null;
        $this->dependencia_id = null;
        $this->uso_rubro_id = null;
        $this->depen = null;  
        $this->pago_id = null; 
        $this->selected_id = null;   
    }
}

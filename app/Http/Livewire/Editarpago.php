<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Pago;
use App\Dependencia;
use App\Contrato;
use App\Rubroprin;
use App\Facturadeta;
use App\User;

class Editarpago extends Component
{
    public $contra, $data, $contradato, $lisusos = array(), $fechafac, $dependencia_id, $uso_rubro_id,
            $depen, $pago_id, $selected_id, $fecha_pago, $consecu_informe, $sum_conse, $select_id,
            $user_id, $users;
    public function render()
    {
        $this->depen = Dependencia::all();
        $this->contra = Pago::orderBy('id', 'desc')->get();
        $this->users = User::all();
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

    public function editencabe($id)
    {
        $record = Pago::findOrFail($id);
        $this->select_id = $record->id;
        $this->fecha_pago = $record->fecha_pago;
        $this->consecu_informe = $record->consecu_informe; //consecutivo del pago
        $this->sum_conse = $record->sum_conse; //consecutivo del informe
        $this->user_id = $record->user_id;
    }

    public function updateencabe($id)
    {
        if ($this->select_id) {
            $record = Pago::findOrFail($this->select_id);
            $record->update(['fecha_pago' => $this->fecha_pago, 'consecu_informe' => $this->consecu_informe,
                    'sum_conse' => $this->sum_conse, 'user_id' => $this->user_id]);   
            $this->data = Pago::findOrFail($this->select_id);  
            foreach ($this->data->facturadetas as $key => $f) {
                $record = Facturadeta::findOrFail($f->id);
                $record->update(['sum_conse'=> $this->sum_conse ]);
            }   
            $this->data = Pago::findOrFail($this->data->id);
            $this->emit('alert', ['type'=> 'success', 'message' => 'Actualizado Correctamente']);          
        } 
        
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

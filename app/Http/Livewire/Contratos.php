<?php

namespace App\Http\Livewire;
use App\Contrato;
use App\Proveedor;
use App\Tipocontrato;
use App\Dependencia;
use Livewire\Component;

class Contratos extends Component
{
    public $proved, $proveedor_id, $numcontrato, $tipoc, $tipocontrato_id, $dependencia_id, $depen,
           $fechacontrato, $valorcontrato, $registro_pres_inic, $plazoejecucion, $objetocontrato,
           $interadmi, $saldo, $selected_id, $pagos;
    public  $createMode = false;
    public  $updateMode = false;

    public function render()
    {
        $this->proved = Proveedor::all();
        $this->tipoc = Tipocontrato::all();
        $this->depen = Dependencia::all();
        return view('livewire.contratos', [ 'data' => Contrato::orderBy('id', 'desc')->paginate(5)]);
    }

    private function resetInput()
    {
        $this->proved = null;
        $this->proveedor_id = null;
        $this->numcontrato =null;
        $this->tipoc = null;
        $this->tipocontrato_id = null;
        $this->dependencia_id = null;
        $this->depen = null;
        $this->fechacontrato = null;
        $this->valorcontrato = null;
        $this->registro_pres_inic = null;
        $this->plazoejecucion = null;
        $this->objetocontrato = null;
        $this->interadmi = null;
        $this->pagos = null;
        $this->saldo = null;
        
    }

    public function cancel()
    {
        $this->createMode = false;
        $this->updateMode = false;
        $this->resetInput();
       // return redirect()->to('/admin');
    }

    public function store()
    {
        $this->saldo = $this->valorcontrato;

        $this->validate([

            'numcontrato' =>'required|unique:contratos',
            'proveedor_id' => 'required|integer|not_in:0',
            'tipocontrato_id' => 'required|integer|not_in:0',
            'dependencia_id' => 'required|integer|not_in:0',
            'fechacontrato' => 'required',
            'valorcontrato' => 'required',
            'plazoejecucion' => 'required',
            'objetocontrato' =>'required',
            

        ]);     

        Contrato::create([
            'numcontrato' => $this->numcontrato, 'proveedor_id' => $this->proveedor_id,
            'tipocontrato_id' => $this->tipocontrato_id, 'dependencia_id' => $this->dependencia_id,
            'fechacontrato' => $this->fechacontrato, 'valorcontrato' => $this->valorcontrato,
            'registro_pres_inic' => $this->registro_pres_inic, 'plazoejecucion' => $this->plazoejecucion,
            'objetocontrato' => $this->objetocontrato, 'saldo' => $this->valorcontrato, 
            'interadmi' => $this->interadmi
        ]);        

        //ucwords — Convierte a mayúsculas el primer caracter de cada palabra de una cadena
        $this->emit('alert', ['type'=> 'success', 'message' => 'Creado Correctamente']);
        $this->resetInput();
    }

    public function edit($id)
    {
        $record = Contrato::findOrFail($id);  
        $this->selected_id = $id;
        $this->numcontrato = $record->numcontrato;
        $this->proveedor_id = $record->proveedor_id;
        $this->tipocontrato_id = $record->tipocontrato_id;
        $this->dependencia_id = $record->dependencia_id;
        $this->fechacontrato = $record->fechacontrato; 
        $this->valorcontrato = $record->valorcontrato;
        $this->registro_pres_inic = $record->registro_pres_inic;
        $this->plazoejecucion = $record->plazoejecucion;
        $this->objetocontrato = $record->objetocontrato; 
        $this->saldo = $record->saldo;
        $this->interadmi = $record->interadmi;
        $this->pagos = $record->pagos;
        $this->createMode = false;
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
            'numcontrato' =>'required|unique:contratos,numcontrato,'.$this->selected_id,
            'proveedor_id' => 'required|integer|not_in:0',
            'tipocontrato_id' => 'required|integer|not_in:0',
            'dependencia_id' => 'required|integer|not_in:0',
            'fechacontrato' => 'required',
            'valorcontrato' => 'required',
            'plazoejecucion' => 'required',
            'objetocontrato' =>'required',
            
        ]);   
         if ($this->selected_id) {
            $record = Contrato::find($this->selected_id);
            $record->update([
                'numcontrato' => $this->numcontrato, 'proveedor_id' => $this->proveedor_id,
                'tipocontrato_id' => $this->tipocontrato_id, 'dependencia_id' => $this->dependencia_id,
                'fechacontrato' => $this->fechacontrato, 'valorcontrato' => $this->valorcontrato,
                'registro_pres_inic' => $this->registro_pres_inic, 'plazoejecucion' => $this->plazoejecucion,
                'objetocontrato' => $this->objetocontrato, 'saldo' => $this->saldo, 
                'interadmi' => $this->interadmi, 'pagos' => $this->pagos                
            ]);   
            $this->emit('alert', ['type'=> 'success', 'message' => 'Actualizado Correctamente']);    
            $this->resetInput();
            $this->updateMode = false;
            $this->createMode = false;
           
        }   
     }

     public function destroy($id)
     {
        if ($id) {
            $record = Contrato::findOrFail($id);
            $record->delete();
            $this->emit('alert', ['type'=> 'success', 'message' => 'Eliminado Correctamente']);
            $this->resetInput();
            $this->updateMode = false;
            $this->createMode = false;
            
        }
     }
}

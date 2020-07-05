<?php

namespace App\Http\Livewire;
use App\Proveedor;
use Livewire\Component;
use Livewire\WithPagination;

class Proveedores extends Component
{
    use WithPagination;
    public $nombre, $nitproveedor, $digver, $email, $telefono, $direccion, $reprelegal, $contacto,
            $cuenta, $tipoper, $regimensimpli = 0, $selected_id;
    public  $createMode = false;
    public  $updateMode = false;
        
    public function render()
    {
        return view('livewire.proveedores',[ 'data' => Proveedor::orderBy('id', 'desc')->paginate(5)]);
    }

    private function resetInput()
    {
        $this->nombre = null;
        $this->nitproveedor = null;
        $this->email =null;
        $this->telefono = null;
        $this->direccion = null;
        $this->reprelegal = null;
        $this->contacto = null;
        $this->regimensimpli = 0;
        $this->tipoper = null;
        $this->cuenta = null;
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
        $this->validate([
            'nombre' =>'required',
            'nitproveedor' => 'required|integer|not_in:0',
            'email' => 'required|email|unique:proveedors',
            'telefono' => 'required',
            'direccion' => 'required',
            'tipoper' =>'required|integer|not_in:0',
        ]);       
        Proveedor::create([
            'nombre' => ucwords($this->nombre), 'nitproveedor' => $this->nitproveedor,
            'email' => $this->email, 'telefono' => $this->telefono,
            'direccion' => $this->direccion, 'tipoper' => $this->tipoper,
            'reprelegal' => $this->reprelegal, 'contacto' => $this->contacto,
            'cuenta' => $this->cuenta, 'regimensimpli' => $this->regimensimpli
        ]);        
        //ucwords — Convierte a mayúsculas el primer caracter de cada palabra de una cadena
        $this->emit('alert', ['type'=> 'success', 'message' => 'Creado Correctamente']);
        $this->resetInput();
    }

    public function edit($id)
    {
        $record = Proveedor::findOrFail($id);  
        $this->selected_id = $id;
        $this->nombre = $record->nombre;
        $this->nitproveedor = $record->nitproveedor;
        $this->email = $record->email;
        $this->telefono = $record->telefono;
        $this->direccion = $record->direccion; 
        $this->tipoper = $record->tipoper;
        $this->reprelegal = $record->reprelegal;
        $this->contacto = $record->contacto;
        $this->cuenta = $record->cuenta; 
        $this->regimensimpli = $record->regimensimpli;
        $this->createMode = false;
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
            'nombre' =>'required',
            'nitproveedor' => 'required|integer|not_in:0',
            'email' => 'required|email|unique:proveedors,email,'.$this->selected_id,
            'telefono' => 'required',
            'direccion' => 'required',
            'tipoper' =>'required|integer|not_in:0',
        ]);   
         if ($this->selected_id) {
            $record = Proveedor::find($this->selected_id);
            $record->update([
                'nombre' => ucwords($this->nombre), 'nitproveedor' => $this->nitproveedor,
                'email' => $this->email, 'telefono' => $this->telefono,
                'direccion' => $this->direccion, 'tipoper' => $this->tipoper,
                'reprelegal' => $this->reprelegal, 'contacto' => $this->contacto,
                'cuenta' => $this->cuenta, 'regimensimpli' => $this->regimensimpli
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
            $record = Proveedor::findOrFail($id);
            $record->delete();
            $this->emit('alert', ['type'=> 'success', 'message' => 'Eliminado Correctamente']);
            $this->resetInput();
            $this->updateMode = false;
            $this->createMode = false;
            
        }
     }


}

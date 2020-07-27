<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\User;
use App\Dependencia;
use Illuminate\Support\Facades\Hash;

class Usuario extends Component
{
    public $name, $email, $password, $dependencia_id;
    
    public function render()
    {
        $depen= Dependencia::all();
        return view('livewire.usuario', compact('depen'));
    }

    public function store()
    {
        $this->validate([

            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            'dependencia_id' => 'required|integer|not_in:0'

        ]);     

        User::create([
            
            'name' => $this->name,
            'email' => $this->email,
            'password' =>Hash::make($this->password),
            'dependencia_id' => $this->dependencia_id

        ]);        

        //ucwords — Convierte a mayúsculas el primer caracter de cada palabra de una cadena
        $this->emit('alert', ['type'=> 'success', 'message' => 'Creado Correctamente']);
        return redirect()->to('/admin');
    }

    public function cancel()
    {
        return redirect()->to('/admin');
    }


}

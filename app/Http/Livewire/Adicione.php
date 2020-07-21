<?php

namespace App\Http\Livewire;
use App\Contrato;
use App\Adicion;
use Livewire\Component;

class Adicione extends Component
{
    public $numcontrato, $data=null, $fechaadicion, $valoradicion, $registroadicion;

    public function render()
    {
        return view('livewire.adicione');
    }

    public function consulcontra()
    {
        $this->validate([
            'numcontrato' =>'required',
        ]);
        $this->data = Contrato::where('numcontrato', $this->numcontrato)->first();
        //dd($this->data);
        //dd($data);
    }

    public function resetInput()
    {
        $this->data = null; 
        $this->fechaadicion = null;
        $this->valoradicion = null;
        $this->registroadicion = null;
    }

    public function store()
    {
        $this->validate([
            'valoradicion' => 'required',
            'fechaadicion' => 'required',
            'registroadicion' => 'required',
        ]);

        $con = Contrato::findOrFail($this->data->id);
        $con->saldo = $con->saldo += $this->valoradicion;
        $con->save();

        Adicion::create([
            'registroadicion' => $this->registroadicion, 
            'fechaadicion' => $this->fechaadicion,
            'valoradicion' => $this->valoradicion,
            'contrato_id' => $this->data->id,
        ]);
        

        $this->emit('alert', ['type'=> 'success', 'message' => 'Creada Correctamente']);
        $this->numcontrato = null;
        $this->resetInput();
    }

    public function cancel()
    {
        $this->numcontrato = null;
        $this->resetInput();
    }

}

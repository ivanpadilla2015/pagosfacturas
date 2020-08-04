<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Contrato;
use App\Rubrocontrato;
use App\Rubroprin;
use App\Adicion;



class Movirubro extends Component
{
    public $numcontrato, $data=null, $rubpri, $datosrubro,$valorrubro, $codi_rub, $rubroprin_id;
    public $adi =['valor' => '', "id" => '', 'nombre_rubro' => '', 'rubrocontrato_id' => ''];
    public $fechaadicion, $registroadicion, $valoradicion ;
     public $rubs = array();

    public function render()
    {
        return view('livewire.movirubro');
    }

    public function consulcontra()
    {
        $this->validate([
            'numcontrato' =>'required',
        ]);
        $this->data = Contrato::where('numcontrato', $this->numcontrato)->first();
        if ($this->data) {
            $this->datosrubro =  Rubrocontrato::where('contrato_id', $this->data->id )->get();
        }else
        {
            $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No existe']);
        }
        
        
        
    }

    public function bus_id_rubrocontra($idr)
    {
        $this->adi['rubrocontrato_id'] = $idr;
    }
    public function agregar()
    {
        $rub = Rubroprin::findOrFail($this->adi['id']); //rubro
        $this->adi['nombre_rubro'] = $rub->nombre_rubro;
        array_push($this->rubs, $this->adi);
        $this->adi =['valor' => '', "id" => '', 'nombre_rubro' => '', 'rubrocontrato_id' => ''];
        //dd($this->rubs);
    }

    public function store()
    {
        $this->totalizar();

        $this->validate([
            'valoradicion' => 'required',
            'fechaadicion' => 'required',
            'registroadicion' => 'required',
        ]);

        
        $con = Contrato::findOrFail($this->data->id);
        $con->saldo = $con->saldo + $this->valoradicion;
        $con->valoradicion = $con->valoradicion + $this->valoradicion;
        $con->gran_total = $con->valorcontrato + $con->valoradicion;
        $con->ejecutado = 100 - round(($con->saldo*100)/$con->gran_total);
        $con->save();

        Adicion::create([
            'registroadicion' => $this->registroadicion, 
            'fechaadicion' => $this->fechaadicion,
            'valoradicion' => $this->valoradicion,
            'contrato_id' => $this->data->id,
        ]);
        
        foreach ($this->rubs as $key => $value) {
               $rubc = Rubrocontrato::findOrFail($value['rubrocontrato_id']);
               $rubc->saldo = $rubc->saldo + $value['valor'];
               $rubc->save();
        }

        $this->emit('alert', ['type'=> 'success', 'message' => 'Creada Correctamente']);
        $this->numcontrato = null;
        $this->resetInput();
    }

    public function totalizar()
    {
        $sum = 0;
        foreach ($this->rubs as $key => $value) {
            $sum += $value['valor'];
        }
        $this->valoradicion = $sum;
    }

    public function resetInput()
    {
        $this->adi =['valor' => '', "id" => '', 'nombre_rubro' => '', 'rubrocontrato_id' => ''];
        $this->data = null;
        $this->datosrubro = null;
        $this->numcontrato = null;
        $this->registroadicion = null;
        $this->fechaadicion = null;
        $this->valoradicion = null;

    }

}

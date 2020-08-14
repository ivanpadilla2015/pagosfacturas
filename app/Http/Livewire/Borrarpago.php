<?php

namespace App\Http\Livewire;

use Livewire\Component;
Use App\Pago;
Use App\Contrato;
Use App\Facturadeta;
Use App\Factura;
Use App\Obliga_pago;
use App\Riesgo_pago;

class Borrarpago extends Component
{
    public $npago, $pag;
    public function render()
    {
        return view('livewire.borrarpago');
    }

    public function buscapago()
    {
        $this->pag = Pago::find($this->npago);
        if(!$this->pag)
        {  
            $this->emit('alert', ['type'=> 'error', 'message' => 'Pago o ID no existe']); 
            $this->resetInput();
        }
        
    }

    public function borrarpago()
    {
            Facturadeta::where('pago_id', $this->pag->id)->delete(); //detalle facturas
            Factura::where('pago_id', $this->pag->id)->delete();  //factura para que no exista
            Obliga_pago::where('pago_id', $this->pag->id)->delete(); 
            Riesgo_pago::where('pago_id', $this->pag->id)->delete();
            $con = Contrato::findOrFail($this->pag->contrato_id);
            $con->saldo = $con->saldo + $this->pag->total;
            $con->pagos = $con->pagos - 1; //decrementa el pagos
            $con->ejecutado = 100 - round(($con->saldo*100)/$con->gran_total); // porcentaje  ejecutado al dia
            $con->save();
            Pago::find($this->pag->id)->delete();
            $this->emit('alert', ['type'=> 'success', 'message' => 'Eliminado Correctamente']);
            $this->resetInput();
    }

    public function resetInput()
    {
        $this->npago = null;
        $this->pag = null;
    }
}

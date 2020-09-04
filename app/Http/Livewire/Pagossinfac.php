<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Contrato;
use App\Pago;
use App\Datosmaestro;

class Pagossinfac extends Component
{
    public $contra, $contrato_id, $consecu_informe, $total, $mes_ejecucion, $pago_corresponde_mes,
            $saldo_viene, $porcentaje_cumplimiento, $fecha_pago, $pag=null;
            //gran_total director', 120);  $table->string('cargo_director user_id
    public function render()
    {
        $this->contra = Contrato::orderBy('numcontrato', 'desc')->get();
        return view('livewire.pagossinfac');
    }

    public function grabarpago()
    {
        $this->validate([
            'contrato_id' => 'required|integer|not_in:0',
            'consecu_informe' => 'required',
            'mes_ejecucion' => 'required|integer|not_in:0',
            'total' => 'required',
            'saldo_viene' => 'required',
            'pago_corresponde_mes' => 'required',
            'porcentaje_cumplimiento' => 'required',
            'fecha_pago' => 'required',
    
           ]);     
        $con = Contrato::findOrFail($this->contrato_id);   
        $this->pag = Pago::where('contrato_id', $this->contrato_id)->where('consecu_informe', $this->consecu_informe)->get();
        //dd($this->pag->count());
        if ($this->pag->count() == 0) {
            $dm = Datosmaestro::findOrFail(1);
           // $fe  = Carbon::now();
            //$fec = $fe->format('Y-m-d');
            $pag = Pago::create(['total'=> $this->total, 'fecha_pago' => $this->fecha_pago, 'contrato_id'=> $this->contrato_id,
                     'saldo_viene' => $this->saldo_viene, 'gran_total' => $con->gran_total, 'consecu_informe'=> $this->consecu_informe,
                     'pago_corresponde_mes' => $this->pago_corresponde_mes, 'mes_ejecucion'=> $this->mes_ejecucion,
                     'porcentaje_cumplimiento' => $this->porcentaje_cumplimiento, 'director'=> $dm->director,
                     'cargo_director' => $dm->cargo_director, 'user_id' => \Auth::id()]);
            $this->emit('alert', ['type'=> 'success', 'message' => 'Creado Correctamente']);
            $this->resetInputs();
        }else
        {
            $this->emit('alert', ['type'=> 'error', 'message' => 'Tramite de Pago existe']); 
        }
    }

    public function resetInputs()
    {
       $this->contrato_id = null; 
       $this->consecu_informe = null;
       $this->total = null;
       $this->mes_ejecucion = null;
       $this->pago_corresponde_mes = null;
       $this->saldo_viene = null;
       $this->porcentaje_cumplimiento = null;
       $this->fecha_pago = null;
    }
}

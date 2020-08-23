<?php

namespace App\Http\Livewire;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Carbon\Carbon;

use App\contrato;
use App\Inforsumini;
use App\Informeadi;
use App\Pago;
use App\Facturadeta;
use App\Datosmaestro;
use App\Obliga_sumin;
use App\Riesgos_sumin;

class Informesuministro extends Component
{
    public $numcontrato, $data=null, $rubpri, $rubroprin_id, $codi_rub, $datosrubro, $datopago,
            $datofac, $correspondiente, $meje;

    public function render()
    {
        return view('livewire.informesuministro');
    }

    public function consulcontra() 
    {
        $this->validate([
            'numcontrato' =>'required',
        ]);
        $this->data = Contrato::where('numcontrato', $this->numcontrato)->first();
        if(!$this->data->suministro)
         {
              $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No es de Suministro']); 
              $this->resetInput();
         } else{
                if($this->data->riesgos->count() < 1)
                {
                    $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No tiene los Riesgos']); 
                    $this->resetInput();
                }else
                {   
                    if($this->data->obligacions->count() > 0){ 
                        if ($this->data) {
                            $info = $this->data->sum_conse+1;
                            $this->datopago =  Pago::where('sum_conse', $info)->where('contrato_id', $this->data->id )->get();
                            $this->datofac =  Facturadeta::where('sum_conse', $info)->where('contrato_id', $this->data->id )->get();

                        }else
                        {
                            $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No existe']);
                        }
                    }else
                    {
                        $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No tiene Obligaciones']); 
                        $this->resetInput();
                    }

            }
        }
    }

    public function crearinforme()
    {
        $this->validate([
            'correspondiente' =>'required',
            'meje' => 'required|integer|not_in:0'
            
        ]);   
        $dm = Datosmaestro::findOrFail(1);//dato director
        $s = 0;
        foreach ($this->datopago as $value) {
            $s += $value->total;
        }
        $fe  = Carbon::now();
        $fec = $fe->format('Y-m-d');
        $inform = Inforsumini::create(['sum_conse'=> $this->data->sum_conse+1, 'saldo_viene'=> $this->data->saldo,
                'total_info' => $s,'gran_total' => $this->data->gran_total, 'porcentaje_cumplimiento' => $this->data->ejecutado,
                'fechainfo' => $fec, 'corresponde_periodo'=> $this->correspondiente, 'mes_ejecucion'=> $this->meje,
                 'director'=> $dm->director,'cargo_director'=> $dm->cargo_director,'contrato_id' => $this->data->id]);
        /*********************Adicion**************************** */         
        foreach ($this->data->adicions as $value) {
            Informeadi::create([
                        'registroadicion' => $value->registroadicion, 
                        'fechaadicion' => $value->fechaadicion,
                        'valoradicion' => $value->valoradicion,
                        'inforsumini_id' => $inform->id,
            ]);
        }
        /*****************agregar obligacion****************************** */
        foreach ($this->data->obligacions as $key => $obl) {
            Obliga_sumin::create(['numeral' => $obl['numeral'],'obligacion_deta'=> $obl['obligacion_deta'],
                               'entregable' => $obl['entregable'], 'mes_ejecucion'=> $this->meje, 'confirmar' => 'SI',
                               'inforsumini_id' => $inform->id]);
       }
       /*****************agregar Riesgos****************************** */
       foreach ($this->data->riesgos as $key => $rie) {
           Riesgos_sumin::create(['tipo' => $rie['tipo'],'descripcion'=> $rie['descripcion'], 'tratamiento'=> $rie['tratamiento'],
                              'responsable' => $rie['responsable'], 'periodicidad'=> $rie['periodicidad'],
                              'inforsumini_id' => $inform->id]);
      }
        $con = Contrato::findOrFail($this->data->id);
        $con->sum_conse = $con->sum_conse + 1; //adicionar informe
        $con->save();

        $this->emit('alert', ['type'=> 'success', 'message' => 'Creado Correctamente']);
        $this->resetInput(); 
        redirect()->route('obligasumi', $inform->id);
    }

    public function resetInput() 
    {
        $this->numcontrato = null;
        $this->data=null;
        $this->rubpri = null; 
        $this->datosrubro = null;
        $this->datopago = null;
        $this->datofac = null;
        $this->correspondiente = null;
        $this->meje = null;
    }

}

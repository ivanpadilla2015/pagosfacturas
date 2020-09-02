<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Carbon\Carbon;
use App\Rubro;
use App\Dependencia;
use App\Contrato;
use App\Rubroprin;
use App\Uso_rubro;
use App\Factudetadi;
use App\Datosmaestro;
use App\Pago;
use App\Factura;
use App\Facturadeta;
use Illuminate\Support\Collection;

class Pagosuministros extends Component
{
    public $contra, $contrato_id, $data, $pagos_id, $usos, $depen, $collection;
    public  $verMode = true;
    public $numfac, $proveedor_id, $total, $pago_id, $pago_corresponde_mes, $porcentaje_cumplimiento,
           $mes_ejecucion, $sal, $vct, $saldo_viene, $feje, $reg, $sumfac;
    public $fact = [
        'numfac' => '',
        'fechafac' => '',
        'valorfac' => '',
        'dependencia_id' => '',
        'rubro_id' => '',
        'nomrub' => '',
        'nomdep' => ''
    ];
    public $lisfact = array();
    public $lisusos = array();
    public $facunica = array();

    public function render()
    {
        $this->usos = Rubro::all();
        $this->depen = Dependencia::all();
        $this->contra = Contrato::orderBy('numcontrato', 'desc')->get();
        return view('livewire.pagosuministros');
    }

    public function consulcon($id)
    {
        $this->resetInputsC();
        if ($id) {
            $this->data = Contrato::findOrFail($id);

            if(!$this->data->suministro)
            {
               $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato no es de Suministro']); 
               $this->resetInput();
            } else
                {
                    
                   if($this->data->rubrocontratos->count() > 0){  //para saber si tiene los rubros o no
                            $this->proveedor_id = $this->data->proveedor_id;
                            $this->sal = $this->data->saldo;
                            $this->vct = $this->data->gran_total;
                        foreach ($this->data->rubrocontratos as $value) {
                           $rprin  = Rubroprin::findOrFail($value->rubroprin_id);        
                            foreach ($rprin->uso_rubros as  $uso) {
                                array_push($this->lisusos, ['id' => $uso->id, 'nombre_uso' => $uso->codigo_uso.' - '.substr($uso->nombre_uso,0,40),'id_prin' => $rprin->id ]); 
                            }
                        }
                            
                    }else
                        {
                            $this->emit('alert', ['type'=> 'error', 'message' => 'Contrato No tiene Rubros']); 
                            $this->resetInput();
                        }
                        
                }   
            //ojo faltaria reg de la adicion
        }
         
    }

    public function agregarfact()
    {
        $this->numfac = $this->fact['numfac'].'_'.$this->proveedor_id.'_'.date("Y");
        
       $this->validate([
        'numfac' =>'required|unique:facturas',
        'fact.fechafac' => 'required',
        'fact.valorfac' => 'required',
        'fact.dependencia_id' => 'required|integer|not_in:0',
  
       ]);     
       
       array_push($this->facunica, $this->fact['numfac']); //para totalizar por factura
       $this->mirar();
       if($this->fact['dependencia_id'])
       {
        $dep = Dependencia::findOrFail($this->fact['dependencia_id']);
        $this->fact['nomdep'] = $dep->nombredepen;
       }
        
       if($this->fact['rubro_id'])
       {
        //$rub = Rubro::findOrFail($this->fact['rubro_id']); 
        $rub = Uso_rubro::findOrFail($this->fact['rubro_id']); //usos
        $this->fact['nomrub'] = $rub->nombre_uso;
       }
       array_push($this->lisfact, $this->fact);
       $this->fact = ['numfac' => '', 'fechafac' => '', 'valorfac' => '','dependencia_id' => '',
        'rubro_id' => '', 'nomrub' => '', 'nomdep' => ''];

        $this->totalizapago();
        
        $this->porcentaje_cumplimiento = 100 - round((($this->sal - $this->total)*100)/$this->vct);

    }

    public function mirar() //para ver el total de las facturas
    {
        $arra=array_unique($this->facunica);
        $this->sumfac= array();
        foreach ($arra as $fa) {
            $s = 0;
            foreach ($this->lisfact as $t) {
                if ($fa == $t['numfac'] ) {
                    $s += $t['valorfac'];
                }
                
            } 
            if($s > 0){
                array_push($this->sumfac, [ 'numfac' => $fa, 'total' => $s]);
            }
        }
       // dd($this->sumfac);
    }

    public function grabarfactura()
    {
        
        $this->totalizapago();

        $con = Contrato::findOrFail($this->contrato_id);
        $con->saldo = $con->saldo - $this->total;
        $con->pagos = $con->pagos + 1; //adicionar pagos
        $con->ejecutado = $this->porcentaje_cumplimiento; // porcentaje  ejecutado al dia
        $con->save();

        ////******************************************************* */
        $dm = Datosmaestro::findOrFail(1);
        $fe  = Carbon::now();
        $fec = $fe->format('Y-m-d');
        $pag = Pago::create(['total'=> $this->total, 'fecha_pago' => $fec, 'contrato_id'=> $this->contrato_id,
                 'saldo_viene' => $this->sal, 'gran_total' => $con->gran_total, 'consecu_informe'=> $con->pagos,
                 'pago_corresponde_mes' => '5XXXXX', 
                 'porcentaje_cumplimiento' => $this->porcentaje_cumplimiento, 'director'=> $dm->director,
                 'cargo_director' => $dm->cargo_director, 'sum_conse'=>  $con->sum_conse + 1,'user_id' => \Auth::id()]);
        $this->pago_id = $pag->id;
        //******************Adicion (es)************************************* */
        foreach ($this->data->adicions as $value) {
            Factudetadi::create([
                'registroadicion' => $value->registroadicion, 
                'fechaadicion' => $value->fechaadicion,
                'valoradicion' => $value->valoradicion,
                'pago_id' => $this->pago_id,
            ]);
            $this->feje = $value->fechaadicion;
            $this->reg .= ' -'.$value->registroadicion;
        }
        if ($this->feje) {
            $fe_eje = Pago::findOrFail($this->pago_id);//ultima fecha ejecucion contrato
            $fe_eje->fecha_plazoeje = $this->feje;
            $fe_eje->registroadicion = $this->reg;
            $fe_eje->save();
        }
        else
        {
            $fe_eje = Pago::findOrFail($this->pago_id);//ultima fecha ejecucion contrato
            $fe_eje->fecha_plazoeje = $con->plazoejecucion;
            $fe_eje->save();
        }
        
        
      ///////////////////////////************************************** */
        
        foreach ($this->lisfact as $key => $f) {
            
            $this->numfac = $f['numfac'].'_'.$this->proveedor_id.'_'.date("Y");
            $existe = Factura::where('numfac', $this->numfac)->first();
            if (!$existe) {
                Factura::create(['numfac'=> $this->numfac, 'fechafac'=> $f['fechafac'], 'contrato_id'=> $this->contrato_id,'pago_id'=> $this->pago_id ]);
            }
            Facturadeta::create(['numfac' => $f['numfac'],'fechafac' => $f['fechafac'], 'valorfac' => $f['valorfac'], 'dependencia_id' => $f['dependencia_id'], 
                                'uso_rubro_id'=> $f['rubro_id'], 'sum_conse'=> $con->sum_conse + 1,'contrato_id'=> $this->contrato_id, 'pago_id'=> $this->pago_id ]);
        }                     //rubro_id = ide el uso      
        /*****************agregar obligacion****************************** */
        /*foreach ($this->data->obligacions as $key => $obl) {
             Obliga_pago::create(['numeral' => $obl['numeral'],'obligacion_deta'=> $obl['obligacion_deta'],
                                'entregable' => $obl['entregable'], 'mes_ejecucion'=> $this->mes_ejecucion, 'confirmar' => 'SI',
                               'pago_id' => $this->pago_id]);
        }
        /*****************agregar Riesgos****************************** */
        /*foreach ($this->data->riesgos as $key => $rie) {
            Riesgo_pago::create(['tipo' => $rie['tipo'],'descripcion'=> $rie['descripcion'], 'tratamiento'=> $rie['tratamiento'],
                               'responsable' => $rie['responsable'], 'periodicidad'=> $rie['periodicidad'],
                               'pago_id' => $this->pago_id]);
       }*/

        $this->emit('alert', ['type'=> 'success', 'message' => 'Pago No: '.$pag->id.' Creado Correctamente']);
        $this->emit('sweet-alert', " Creado Corretamente Numero  ".$pag->id);
        $this->resetInput();
       /* redirect()->route('oblipa', $pag->id);*/
    }

    public function elimina($key)
    {
        unset($this->lisfact[$key]);
    }
    
    public function totalizapago()
    {
        $this->total = null;
        
        foreach ($this->lisfact as $t) {
              
            $this->total += $t['valorfac'];
        }  
               
    }

    public function resetInput()
    {
        $this->fact = ['numfac' => '', 'fechafac' => '', 'valorfac' => '','dependencia_id' => '',
        'rubro_id' => '', 'nomrub' => '', 'nomdep' => ''];
        $this->data= null;
        $this->pagos_id = null; 
        $this->usos = null;
        $this->depen = null;
        $this->total = null;
        $this->contrato_id = null;
        $this->pago_corresponde_mes = null;
        $this->porcentaje_cumplimiento = null;
        $this->mes_ejecucion = null;
        $this->lisfact = array();

    }

    public function resetInputsC()
    {
        $this->fact = ['numfac' => '', 'fechafac' => '', 'valorfac' => '','dependencia_id' => '',
        'rubro_id' => '', 'nomrub' => '', 'nomdep' => ''];
        $this->data= null;
        $this->pagos_id = null; 
        $this->usos = null;
        $this->depen = null;
        $this->total = null;
        $this->lisfact = array();
        $this->lisusos = array();
        $this->facunica = array();

    }
}

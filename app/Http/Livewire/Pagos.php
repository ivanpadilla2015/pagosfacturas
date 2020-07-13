<?php

namespace App\Http\Livewire;
use App\Contrato;
use App\Rubro;
use App\Dependencia;
use App\Pago;
use App\Factura;
use App\Facturadeta;
use Carbon\Carbon;
use Livewire\Component;
use Illuminate\Support\Collection;

class Pagos extends Component
{
    public $contra, $contrato_id, $data, $pagos_id, $usos, $depen, $collection;
    public  $verMode = false; 
    public $numfac, $proveedor_id, $total, $pago_id;
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
    
    public function render()
    {
        $this->usos = Rubro::all();
        $this->depen = Dependencia::all();
        $this->contra = Contrato::all();
        return view('livewire.pagos');
    }

    public function consulcon($id)
    {
        $this->resetInputsC();
        if ($id) {
            $this->data = Contrato::findOrFail($id);
            $this->proveedor_id = $this->data->proveedor_id;
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
       
       if($this->fact['dependencia_id'])
       {
        $dep = Dependencia::findOrFail($this->fact['dependencia_id']);
        $this->fact['nomdep'] = $dep->nombredepen;
       }
        
       if($this->fact['rubro_id'])
       {
        $rub = Rubro::findOrFail($this->fact['rubro_id']); 
        $this->fact['nomrub'] = $rub->nombrerubro;
       }
       array_push($this->lisfact, $this->fact);
       $this->fact = ['numfac' => '', 'fechafac' => '', 'valorfac' => '','dependencia_id' => '',
        'rubro_id' => '', 'nomrub' => '', 'nomdep' => ''];

    }

    public function grabarfactura()
    {
        
        $this->totalizapago();
        $fe  = Carbon::now();
        $fec = $fe->format('Y-m-d');
        $pag = Pago::create(['total'=> $this->total, 'fecha_pago' => $fec, 'contrato_id'=> $this->contrato_id, 'user_id' => \Auth::id()]);
        $this->pago_id = $pag->id;
        
        foreach ($this->lisfact as $key => $f) {
            
            $this->numfac = $f['numfac'].'_'.$this->proveedor_id.'_'.date("Y");
            $existe = Factura::where('numfac', $this->numfac)->first();
            if (!$existe) {
                Factura::create(['numfac'=> $this->numfac, 'fechafac'=> $f['fechafac'], 'contrato_id'=> $this->contrato_id,'pago_id'=> $this->pago_id ]);
            }
            Facturadeta::create(['numfac' => $f['numfac'],'fechafac' => $f['fechafac'], 'valorfac' => $f['valorfac'], 'dependencia_id' => $f['dependencia_id'], 
                                'rubro_id'=> empty($f['rubro_id']) ? 1 : $f['rubro_id'], 'contrato_id'=> 1, 'pago_id'=> $this->pago_id ]);
        }
        $this->emit('alert', ['type'=> 'success', 'message' => 'Pago No: '.$pag->id.' Creado Correctamente']);
        $this->resetInput();
    }

    public function elimina($key)
    {
        unset($this->lisfact[$key]);
    }
    
    public function totalizapago()
    {
       
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

    }

  
}

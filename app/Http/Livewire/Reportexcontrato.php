<?php

namespace App\Http\Livewire;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use App\contrato;
use App\Rubrocontrato;
use App\Facturadeta;

class Reportexcontrato extends Component
{
    public $data, $datosrubro, $numcontrato, $fechaini, $fechafin, $sumxrubro, $detarubro;

    public function render()
    {
        return view('livewire.reportexcontrato');
    }

    public function consulcontra()
    {
        $this->validate([
            'numcontrato' =>'required',
        ]);
        $this->data = Contrato::where('numcontrato', $this->numcontrato)->first();
        $this->datosrubro =  Rubrocontrato::where('contrato_id', $this->data->id )->get();
        //dd($this->datosrubro);
        
    }

    public function consultafecha()
    {
        
        //json_decode(DB::table('products')->whereIn('name', ['Product A', 'Product B'])->get()->toJson(), true);
        $rubro = DB::table('facturadetas')
            ->join('uso_rubros', 'uso_rubros.id', '=', 'facturadetas.uso_rubro_id')
            ->join('pagos', 'pagos.id', '=', 'facturadetas.pago_id')
            ->join('rubroprins', 'rubroprins.id', '=', 'uso_rubros.rubroprin_id')
            ->join('contratos', 'contratos.id', '=', 'facturadetas.contrato_id')
            ->select('facturadetas.numfac', 'rubroprins.nombre_rubro', 'facturadetas.valorfac', 'pagos.fecha_pago','rubroprins.id','uso_rubros.id as uso','uso_rubros.nombre_uso', DB::raw('SUM(facturadetas.valorfac) as total_fac') )
            ->groupBy('rubroprins.id')
            ->where('pagos.fecha_pago', '>=', $this->fechaini)
            ->where('pagos.fecha_pago', '<=', $this->fechafin)
            ->where('contratos.id', $this->data->id)
            ->get();
           $this->sumxrubro= $rubro->toJson();
           
        $this->detarubro = DB::table('facturadetas')
            ->join('uso_rubros', 'uso_rubros.id', '=', 'facturadetas.uso_rubro_id')
            ->join('pagos', 'pagos.id', '=', 'facturadetas.pago_id')
            ->join('rubroprins', 'rubroprins.id', '=', 'uso_rubros.rubroprin_id')
            ->join('contratos', 'contratos.id', '=', 'facturadetas.contrato_id')
            ->select('facturadetas.numfac', 'rubroprins.nombre_rubro', 'facturadetas.valorfac', 'pagos.fecha_pago','rubroprins.id','uso_rubros.id as uso','uso_rubros.nombre_uso')
            ->where('pagos.fecha_pago', '>=', $this->fechaini)
            ->where('pagos.fecha_pago', '<=', $this->fechafin)
            ->where('contratos.id', $this->data->id)
            ->get();
        
        
           // dd($this->detarubro);*/

         
    }
}

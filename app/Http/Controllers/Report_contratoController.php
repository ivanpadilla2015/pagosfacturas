<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Contrato;
use App\Proveedor;

class Report_contratoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        
    }

    public function index()
    {
        return view('reportes.reportexcontratophp');
    }
    
    public function reportexcontrato(Request $request)
    {
        $request->validate([
            'numcontrato' => 'required',
            'fechaini' => 'required',
            'fechafin' => 'required'
        ]);

        $data = Contrato::where('numcontrato', $request->numcontrato)->first();
        $rubro = DB::table('facturadetas')
            ->join('uso_rubros', 'uso_rubros.id', '=', 'facturadetas.uso_rubro_id')
            ->join('pagos', 'pagos.id', '=', 'facturadetas.pago_id')
            ->join('rubroprins', 'rubroprins.id', '=', 'uso_rubros.rubroprin_id')
            ->join('contratos', 'contratos.id', '=', 'facturadetas.contrato_id')
            ->select('facturadetas.numfac', 'rubroprins.nombre_rubro', 'facturadetas.valorfac', 'pagos.fecha_pago','rubroprins.id','uso_rubros.id as uso','uso_rubros.nombre_uso', DB::raw('SUM(facturadetas.valorfac) as total_fac') )
            ->groupBy('rubroprins.id')
            ->where('pagos.fecha_pago', '>=', $request->fechaini)
            ->where('pagos.fecha_pago', '<=', $request->fechafin)
            ->where('contratos.id', $data->id)
            ->get();
            
        return view('reportes.reportexcontraphpdata', compact('data', 'rubro'));
    }

    public function rubros_contrato(Request $request)
    {
        if ($request->contrato_id) {
            $dato = Rubrocontrato::with('rubroprin:id, nombre_rubro, saldo')->where('contrato_id', $request->contrato_id)->get();
            return response()->json([
                'rubros' => $dato,
            ], 200);

        }
    }

    public function buscacontra()
    {
      return Contrato::with('proveedor:id,nombre')->orderBy('id', 'desc')->get();
    }

    public function buscaprovee()
    {
        return Proveedor::orderBy('nombre', 'asc')->get();
    }

    public function totalrubros(Request $request)
    {
        $data = Contrato::with('proveedor:id,nombre')->findOrFail($request->id);
        $rubro = DB::table('facturadetas')
            ->join('uso_rubros', 'uso_rubros.id', '=', 'facturadetas.uso_rubro_id')
            ->join('pagos', 'pagos.id', '=', 'facturadetas.pago_id')
            ->join('rubroprins', 'rubroprins.id', '=', 'uso_rubros.rubroprin_id')
            ->join('contratos', 'contratos.id', '=', 'facturadetas.contrato_id')
            ->select('facturadetas.numfac', 'rubroprins.nombre_rubro', 'facturadetas.valorfac', 'pagos.fecha_pago','rubroprins.id','uso_rubros.id as uso','uso_rubros.nombre_uso', DB::raw('SUM(facturadetas.valorfac) as total_fac') )
            ->groupBy('rubroprins.id')
            ->where('pagos.fecha_pago', '>=', $request->fechaini)
            ->where('pagos.fecha_pago', '<=', $request->fechafin)
            ->where('contratos.id', $data->id)
            ->get();

          $rubrodeta = DB::table('facturadetas')
            ->join('uso_rubros', 'uso_rubros.id', '=', 'facturadetas.uso_rubro_id')
            ->join('pagos', 'pagos.id', '=', 'facturadetas.pago_id')
            ->join('rubroprins', 'rubroprins.id', '=', 'uso_rubros.rubroprin_id')
            ->join('contratos', 'contratos.id', '=', 'facturadetas.contrato_id')
            ->select('facturadetas.numfac', 'rubroprins.nombre_rubro', 'pagos.consecu_informe as pagonum', 'facturadetas.valorfac', 'pagos.fecha_pago','rubroprins.id','uso_rubros.id as uso','uso_rubros.nombre_uso' )
            ->where('pagos.fecha_pago', '>=', $request->fechaini)
            ->where('pagos.fecha_pago', '<=', $request->fechafin)
            ->where('contratos.id', $data->id)
            ->get();    

            return response()->json([
                'data' => $data,
                'srubro' => $rubro,
                'rubdeta' => $rubrodeta,
            ], 200);
    }

    public function buscafacturas(Request $request)
    {
        //dd($request->params['id']);
        $fact = DB::table('facturadetas')
                ->join('pagos', 'pagos.id', '=', 'facturadetas.pago_id')
                ->join('contratos', 'contratos.id', '=', 'facturadetas.contrato_id')
                ->join('proveedors', 'proveedors.id', '=', 'contratos.proveedor_id')
                ->select('facturadetas.numfac', 'pagos.consecu_informe as pagonum', 'facturadetas.valorfac', 'contratos.numcontrato', 'pagos.fecha_pago','proveedors.id as idprove','proveedors.nombre')
                ->where('pagos.fecha_pago', '>=', $request->params['fechaini'])
                ->where('pagos.fecha_pago', '<=', $request->params['fechafin'])
                ->where('proveedors.id', $request->params['id'])
                ->get();   
                return response()->json([
                    'facts' => $fact,                   
                ], 200); 
    }
  
}

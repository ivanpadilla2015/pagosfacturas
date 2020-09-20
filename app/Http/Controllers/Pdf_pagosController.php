<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Pago;
use App\Facturadeta;
use App\Datosmaestro;
use App\Inforsumini;
use PDF;

class Pdf_pagosController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        
    }

    public function index()
    {
        $contra = Pago::orderBy('id', 'desc')->get();
        
        return view('reportes.pagos_pdf_num', compact('contra'));
    }

    public function vistapago(Request $request)
    {
        $request->validate([
            'pago_id' => 'required|integer|not_in:0'
        ]);
        
        $dato = Pago::findOrFail($request->pago_id);
        return view('reportes.pdf_controlpago_vista', compact('dato') ); 
    }

    public function Pdfxpagonum($id)
    {
        
        $datos = Pago::findOrFail($id);
        $dmaestro = Datosmaestro::findOrFail(1);
        $rubro = DB::table('facturadetas')
            ->join('uso_rubros', 'uso_rubros.id', '=', 'facturadetas.uso_rubro_id')
            ->select('facturadetas.numfac', 'uso_rubros.nombre_uso', 'facturadetas.uso_rubro_id','uso_rubros.codigo_uso', DB::raw('SUM(facturadetas.valorfac) as total_fac'))
            ->groupBy('facturadetas.uso_rubro_id')
            ->where('facturadetas.pago_id', $datos->id)
            ->get();
        //return $rubro;
        $pdf= PDF::loadView('reportes.pdf_pago_num', compact('datos','rubro', 'dmaestro'));
        $pdf->setPaper('letter', 'landscape');
        return $pdf->stream();
    }

    public function informesuperv($id)
    {
        $data = Pago::findOrFail($id);
        $facdetas= DB::table('facturadetas')->select('numfac', 'fechafac',DB::raw('SUM(valorfac) as valorfac'))
                    ->groupBy('numfac')->where('pago_id', $data->id)->get();
        //return $facdetas;
        $pdf= PDF::loadView('reportes.pdf_informe_supervisor', compact('data', 'facdetas'));
        $pdf->setPaper('letter');
        return $pdf->stream();
        
    }

    public function Pdfxpagonumnew()
    {
        //return $request;
        $datos = Pago::findOrFail(request('id'));
        $pag_ante = Pago::where('contrato_id', $datos->contrato_id)->where('consecu_informe', '<', $datos->consecu_informe)->get();
        $dmaestro = Datosmaestro::findOrFail(1);
        $fe  = Carbon::now(); 
        $fec = $fe->format('Y').".".$fe->format('m').".".$fe->format('d')." ".$fe->format('H:i:s')." -05'00'";
        $rubro = DB::table('facturadetas')
            ->join('uso_rubros', 'uso_rubros.id', '=', 'facturadetas.uso_rubro_id')
            ->select('facturadetas.numfac', 'uso_rubros.nombre_uso', 'facturadetas.uso_rubro_id','uso_rubros.codigo_uso', DB::raw('SUM(facturadetas.valorfac) as total_fac'))
            ->groupBy('facturadetas.uso_rubro_id')
            ->where('facturadetas.pago_id', $datos->id)
            ->get();
        //return $rubro;
        $spacio = request('space');
        $resp = request('resp');
        $pdf= PDF::loadView('reportes.pdf_pago_num_new', compact('datos','rubro', 'dmaestro', 'spacio', 'pag_ante', 'fec', 'resp'));
        $pdf->setPaper('letter', 'landscape');
        return $pdf->stream();
    }

    public function selectinfo()
    {
        $inform = Inforsumini::orderBy('id', 'desc')->get();
        return view('reportes.pdf_info_sumini_1', compact('inform'));
    }

    public function vistainfo(Request $request)
    {
        $request->validate([
            'inforsumini_id' => 'required|integer|not_in:0'
        ]);
          $fe  = Carbon::now(); 
          $fec = $fe->format('Y').".".$fe->format('m').".".$fe->format('d')." ".$fe->format('H:i:s')." -05'00'";

          //$fec = $fe->toDateTimeString();
     
        $data = Inforsumini::findOrFail($request->inforsumini_id);
        $datofac= DB::table('facturadetas')
        ->join('dependencias', 'dependencias.id', '=', 'facturadetas.dependencia_id')
        ->select('numfac', 'fechafac', 'dependencias.nombredepen',DB::raw('SUM(valorfac) as valorfac'))
        ->groupBy('numfac')->where('sum_conse', $data->sum_conse)->where('contrato_id', $data->contrato_id )->get();
        $resp = $request->resp;
        $pdf= PDF::loadView('reportes.pdf_info_sumini_3', compact('data', 'datofac', 'fec', 'resp'));
        $pdf->setPaper('letter');
        return $pdf->stream();
    }

   

}

<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Pago;
use App\Facturadeta;
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
        $rubro = DB::table('facturadetas')
            ->join('rubros', 'rubros.id', '=', 'facturadetas.rubro_id')
            ->select('facturadetas.numfac', 'rubros.nombrerubro', 'facturadetas.rubro_id','rubros.codigo', DB::raw('SUM(facturadetas.valorfac) as total_fac'))
            ->groupBy('facturadetas.rubro_id')
            ->where('facturadetas.pago_id', $datos->id)
            ->get();
        //return $rubro;
        $pdf= PDF::loadView('reportes.pdf_pago_num', compact('datos','rubro'));
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

    public function contratos()
    {
        
    }

}

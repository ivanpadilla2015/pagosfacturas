<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Contrato;

class Report_contratoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        
    }

    public function reportexcontrato()
    {
        $datacon = Contrato::orderBy('id', 'desc')->get();
        return view('reportes.reportexcontrato', compact('datacon'));
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
  
}

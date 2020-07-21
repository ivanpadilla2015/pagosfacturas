<?php

namespace App\Http\Controllers;
use App\Pago;
use Illuminate\Http\Request;
use PDF;

class PdfController extends Controller
{
    
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $contra = Pago::orderBy('id', 'desc')->get();
        return view('reportes.pagosxnumero2', compact('contra'));
    }

    public function Pdfpagosxnums(Request $request)
    {
        if ($request->pago_id) {
            $dato = Pago::with('contrato', 'contrato.proveedor', 'facturadetas', 'facturadetas.dependencia', 'facturadetas.rubro')->where('id', $request->pago_id)->get();
            return response()->json([
                'pago' => $dato,
            ], 200);

        }
        
    }
    
    public function Pdfxpagonum()
    {
        $pdf= PDF::loadView('reportes.pdf_pago_num');
        $pdf->setPaper('letter', 'landscape');
        return $pdf->stream();
    }

    public function Pdfinformesuper()
    {
        $pdf= PDF::loadView('reportes.pdf_estudio_prev');
        //$pdf->setPaper('letter', 'landscape');
        return $pdf->stream();
    }

       /* $request->validate([
            'id' => 'required|integer|not_in:0',
        ]);
        $user = User::findOrFail($request->input('id'));*/
        
        

     /*public function Pdfpagosxnums()
     {
        
        $contra = \App\Pago::orderBy('id', 'desc')->get();
         return response()->json([
                'pags' => $contra,
          ], 200);
     }   */
    

    public function Pdfxusuario2(Request $request)
    {
        $request->validate([
            'id' => 'required|integer|not_in:0',
        ]);
        $user = User::findOrFail($request->input('id'));
        $pdf= PDF::loadView('pdfs.pdfxusuario', compact('user'));
        return $pdf->stream();
        
    }
}

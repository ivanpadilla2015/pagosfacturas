<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Obliga_pago;

class ObligapagosController extends Controller
{
    public function Obligaciondepagos($id)
    {
        $dato_obli = Obliga_pago::where('pago_id', $id)->get();
        //return($dato_obli);
        return view('pagos.crearinforme', compact('dato_obli'));
    }

    public function actualizarobliga(Request $request)
    {
        $record = Obliga_pago::find($request->id_obli);
        $record->update(['numeral' => $request->numeral, 'obligacion_deta' => $request->obligacion_deta,
                        'entregable' => $request->entregable]);
        return back();
    }
}

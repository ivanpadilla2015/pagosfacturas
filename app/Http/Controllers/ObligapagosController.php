<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Obliga_pago;
use App\Pago;

class ObligapagosController extends Controller
{
    public function Obligaciondepagos($id)
    {
        $pago = Pago::findOrFail($id);
        $dato_obli = Obliga_pago::where('pago_id', $id)->paginate(3);;
        //return($dato_obli);
        return view('pagos.crearinforme', compact('dato_obli', 'pago'));
    }

    public function upadate(Request $request, $id)
    {
        //oblipa/2
        $record = Obliga_pago::find($id);
        $record->update(['numeral' => $request->numeral, 'obligacion_deta' => $request->obligacion_deta,
                        'entregable' => $request->entregable]);
        toastr()->success('Actualizado Correctamente');
        return back();
    }
}

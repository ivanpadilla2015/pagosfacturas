<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Obliga_pago;
use App\Riesgo_pago;
use App\Inforsumini;
use App\Obliga_sumin;
use App\Riesgos_sumin;
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
                        'entregable' => $request->entregable, 'confirmar' =>  strtoupper($request->confirmar)]);
        toastr()->success('Actualizado Correctamente');
        return back();
    }

    public function vistariesgos($id)
    {
        $pago = Pago::findOrFail($id);
        $dato_ries = Riesgo_pago::where('pago_id', $id)->paginate(3);;
        //return($dato_obli);
        return view('pagos.riesgosinforme', compact('dato_ries', 'pago'));
    }

    public function grabariesgos(Request $request, $id)
    {
        $record = Riesgo_pago::find($id);
        $record->update(['tipo' => $request->tipo, 'descripcion' => $request->descripcion, 'tratamiento' => $request->tratamiento,
                        'responsable' => $request->responsable, 'periodicidad' => $request->periodicidad]);
        
        toastr()->success('Actualizado Correctamente');
        return back();
    }

    /************************INFORME SUMINISTROS**************************** */
    public function Obligaciondesumis($id)
    {
        $info = Inforsumini::findOrFail($id);
        $dato_obli = Obliga_sumin::where('inforsumini_id', $id)->paginate(3);;
        //return($dato_obli);
        return view('pagos.crearinfobigaciones', compact('dato_obli', 'info'));
    }

    public function actualizainfosumi(Request $request, $id)
    {
        //oblipa/2
        $record = Obliga_sumin::find($id);
        $record->update(['numeral' => $request->numeral, 'obligacion_deta' => $request->obligacion_deta,
                        'entregable' => $request->entregable, 'confirmar' =>  strtoupper($request->confirmar)]);
        toastr()->success('Actualizado Correctamente');
        return back();
    }

    public function vistariesgosinfo($id)
    {
        $info = Inforsumini::findOrFail($id);
        $dato_ries = Riesgos_sumin::where('inforsumini_id', $id)->paginate(3);;
        //return($dato_obli);
        return view('pagos.riesgoinformesumi', compact('dato_ries', 'info'));
    }

    public function grabavistariesgos(Request $request, $id)
    {
        $record = Riesgos_sumin::find($id);
        $record->update(['tipo' => $request->tipo, 'descripcion' => $request->descripcion, 'tratamiento' => $request->tratamiento,
                        'responsable' => $request->responsable, 'periodicidad' => $request->periodicidad]);
        
        toastr()->success('Actualizado Correctamente');
        return back();
    }
   
}

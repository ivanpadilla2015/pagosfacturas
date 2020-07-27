<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="{{ public_path('css/stylos.css')}}">
    <title>Reporte Pago Financiero</title>
   </head>
  <body>
 		<div>
  			<img src="{{ public_path('img/gf-fO-35.jpg')}}" class="img-fluid w-100" alt="Responsive image ">
  		</div>
      <table>
        <tr>
          <td class="c3"><strong>Contrato No:</strong></td>
        <td class="c2">{{ $datos->contrato->numcontrato }}</td>
          <td class="c3" style="text-align: right" ><strong>No Registro Presupuestal:</strong></td>
          <td class="c1" style="text-align: center">{{$datos->contrato->registro_pres_inic.$datos->registroadicion}}</td>
        </tr>
        <tr>
          <td class="c3"><strong>Nombre Contratista:</strong> </td>
          <td class="c2">{{ $datos->contrato->proveedor->nombre}}</td>
          <td class="c3" style="text-align: right" ></td>
          <td class="c1" style="text-align: center"></td>
        </tr>
        <tr>
          <td class="c3"><strong>Presupuesto cargo a ALFM:</strong></td>
          <td class="c2"><b>SI__</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NO__</td>
          <td class="c3" style="text-align: right" ></td>
          <td class="c1" style="text-align: center"></td>
        </tr>
      </table>
      <table>
        <tr>
          <td> <b>Con cargo al (los) contrato(s) interadministrativo(s)</b> </td>
          <td> {{$datos->contrato->concargo->detalle_inter}}</td>
          <td> <b> Plazo de Ejecucion:</b></td>
           @php  $fecha = new DateTime($datos->fecha_plazoeje);
                 $fecha_m_d_y = $fecha->format('d/m/Y'); @endphp 
          <td>__{{$fecha_m_d_y}}____</td>
        </tr>
        <tr>
          <td> <b>Celebrado(s) con:</b> </td>
          <td>__{{$datos->contrato->concargo->con_cargo_a}}____</td>
          <td></td>
          <td></td>
        </tr>
      </table>
  	<table id="padre">
  	
	    <tr>
	      <th class="t1" >
            {{ $datos->contrato->objetocontrato }}

	      </th>
	      <th class="colu" style="">Codigo de Uso Ppal</th>
	      <th class="colu" >Fecha</th>
	      <th class="colu" >Valor anticipo acuerdo porcentaje del contrato</th>
	      <th class="colu" >Saldo por amortizar del anticipo</th>
	      <th class="colu" >Vr. Facturador</th>
	      <th class="colu">Valor a Pagar</th>
	      <th class="colu" >Saldo por Ejecutar</th>
	    </tr>
  
  <tbody>
    @php  $fe = new DateTime($datos->contrato->fechacontrato);
                 $fecon = $fe->format('d/m/Y'); @endphp 
    <tr>
      <td class="colu" >VR CONTRATO</td>
      <td class="colu">{{ number_format($datos->contrato->valorcontrato)}}</td>
      <td class="colu">{{ $fecon }}</td>
      <td class="colu"></td>
      <td class="colu"></td>
      <td class="colu"></td>
      <td class="colu"></td>
      <td class="colu" style="text-align: center">{{ number_format($datos->saldo_viene)}}</td>
    </tr>
    @php $c = 0; $rega = '' @endphp
    @foreach ($datos->factudetadis as $itemadi)
      @php $c += 1; $fe = new DateTime($itemadi->fechaadicion);  $fea = $fe->format('d/m/Y'); $rega =$itemadi->registroadicion @endphp
      <tr>
        <td class="colu" >{{'Adicion N° '.$c}}</td>
        <td class="colu">{{ number_format($itemadi->valoradicion) }}</td>
        <td class="colu">{{ $fea  }}</td>
        <td class="colu"></td>
        <td class="colu"></td>
        <td class="colu"></td>
        <td class="colu"></td>
        <td class="colu"></td>
      </tr>
    @endforeach
    
    <tr>
      <td class="colu"><b>Total Contrato</b></td>
      <td class="colu"><b>{{ number_format($datos->gran_total) }}</b></td>
      <td class="colu"></td>
      <td class="colu"></td>
      <td class="colu"></td>
      <td class="colu"></td>
      <td class="colu"></td>
      <td class="colu"></td>
    </tr>
    <tr>
    <td class="colu" colspan="8" style="text-align: center; background-color: #d1cccc; "><b>Tramite de Pago No {{ ' '.$datos->consecu_informe." ".$action = empty($rega) ? ' ' : 'Adicio Reg: '.$rega }}</b></td>
      
    </tr>
    @php $s = 0; $sdo = $datos->saldo_viene; @endphp
      @foreach ($rubro as $item)
            <tr>
              <td class="colu">{{$item->nombrerubro}}</td>
              <td class="t2">{{$item->codigo}}</td>
              <td class="colu"></td>
              <td class="colu"></td>
              <td class="colu"></td>
              <td class="colu"></td>
              <td class="colu"></td>
              <td class="colu"></td>
            </tr>
          @foreach ($datos->facturadetas as $fac)
            @if ($item->rubro_id == $fac->rubro_id)
                @php $s += $fac->valorfac; $sdo -= $fac->valorfac;
                $fe = new DateTime($fac->fechafac);  $fefa = $fe->format('d/m/Y');
              @endphp
              <tr>
                <td class="colu" >{{'FAC: '.$fac->numfac}}</td>
                <td class="colu"></td>
                <td class="colu">{{ $fefa }}</td>
                <td class="colu"></td>
                <td class="colu" style="text-align: center"></td>
                <td class="colu" style="text-align: center">{{ number_format($fac->valorfac) }}</td>
                <td class="colu" style="text-align: center">{{ number_format($fac->valorfac) }}</td>
                <td class="colu" style="text-align: center">{{ number_format($sdo)}}</td>
              </tr>
            @endif
          @endforeach
            <tr>
              <td class="colu" style="text-align: center"></td>
              <td class="colu" style="text-align: center"></td>
              <td class="colu" style="text-align: center"></td>
              <td class="colu" style="text-align: center"></td>
              <td class="colu">Total</td>
              <td class="colu" style="text-align: center">{{ number_format($item->total_fac)}}</td>
              <td class="colu" style="text-align: center">{{ number_format($item->total_fac)}}</td>
              <td class="colu" style="text-align: center"></td>
            </tr>
      @endforeach
    <tr>
      <th class="colu" style="background-color: #d1cccc;" >Total Tramite Pago No {{$datos->consecu_informe}}</th>
      <th class="colu" style="background-color: #d1cccc;"></th>
      <th class="colu" style="background-color: #d1cccc;"></th>
      <th class="colu" style="background-color: #d1cccc;"></th>
      <th class="colu" style="background-color: #d1cccc;"></th>
      <th class="colu" style="background-color: #d1cccc;">{{number_format($s)}}</th>
      <th class="colu" style="background-color: #d1cccc;">{{number_format($datos->total)}}</th>
      <th class="colu" style="background-color: #d1cccc;">{{number_format($sdo)}}</th>
    </tr>
   
    @php $sum = 0 @endphp
    @foreach ($rubro as $item)
         @php $sum += $item->total_fac  @endphp
        <tr>
          <td class="colu">{{$item->nombrerubro}}</td>
          <td class="t2">{{$item->codigo}}</td>
          <td class="colu"></td>
          <td class="colu"></td>
          <td class="colu"></td>
          <th class="colu">{{ number_format($item->total_fac)}}</th>
          <th class="colu">{{ number_format($item->total_fac)}}</th>
          <th class="colu"></th>
        </tr>
    @endforeach
    <tr>
      <td class="colu" style="background-color: #d1cccc;">Sub Total Uso</td>
      <td class="t2" style="background-color: #d1cccc;"></td>
      <td class="colu" style="background-color: #d1cccc;"></td>
      <td class="colu" style="background-color: #d1cccc;"></td>
      <td class="colu" style="background-color: #d1cccc;"></td>
      <th class="colu" style="background-color: #d1cccc;">{{ number_format($sum)}}</th>
      <th class="colu" style="background-color: #d1cccc;">{{ number_format($sum)}}</th>
      <th class="colu" style="background-color: #d1cccc;"></th>
    </tr>
  </tbody>
</table>
<br><br>

_______________________________
<div>Elaboró: {{ $datos->user->name }}</div>
<div>Resp. {{ $datos->user->dependencia->nombredepen }}</div>
    
 	
   
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
  </body>

</html>

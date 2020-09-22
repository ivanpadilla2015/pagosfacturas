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
      <table > 
        <tr >
          <td class="c3"><strong>Contrato No:</strong></td>
          <td class="c2" >{{ $datos->contrato->numcontrato }}</td>
          <td class="c3" style="text-align: right;" ><strong>No Registro Presupuestal:</strong></td>
          <td class="c1" style="text-align: center;">{{$datos->contrato->registro_pres_inic.$datos->registroadicion}}</td>
        </tr>
        <tr>
          <td class="c3" ><strong>Nombre Contratista:</strong> </td>
          <td class="c2">{{ $datos->contrato->proveedor->nombre}}</td>
          <td class="c3" style="text-align: right" ></td>
          <td class="c1" style="text-align: center"></td>
        </tr>
        <tr>
          @php $car = $datos->contrato->concargo->con_cargo_a @endphp 
          
          <td class="c3"><strong>Presupuesto cargo a ALFM:</strong></td>
         <!-- <td class="c2"><b> {{ $action = (substr($car,0,4) == 'Alfm') ? 'SI' : 'NO' }} </b> </td>-->
          <td class="c2"><b> {{ 'SI' }} </b> </td>
          <td class="c3" style="text-align: right" ></td>
          <td class="c1" style="text-align: center"></td>
        </tr>
        <tr>
          <td> <b>Con cargo a contrato(s) interadmin(s)</b> </td>
          <td> {{$datos->contrato->concargo->detalle_inter}}</td>
          <td> <b> Plazo de Ejecucion:</b></td>
           @php  
                if (empty($datoc->newplazoejecucion)) {
                  $fecon = $datoc->plazoejecucion;
                }else {
                  $fecon = $datoc->newplazoejecucion;
                }
                $fecha = new DateTime($fecon);
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
	      <th class="colu" >Vr. Facturado</th>
	      <th class="colu">Valor a Pagar</th>
	      <th class="colu" >Saldo por Ejecutar</th>
	    </tr>
 
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

    @foreach ($pag_ante as $hechos)
      <tr>
        <td class="colu" colspan="5" style="text-align: center;"> <b>Pago No {{ ' '.$hechos->consecu_informe }}</b> </td>
        <td class="colu" colspan="1" style="text-align: center;">{{ number_format($hechos->total) }}</td>
        <td class="colu" colspan="2" style="text-align: center;"></td>
      </tr>
    @endforeach

    <tr>
    <td class="colu" colspan="8" style="text-align: center; background-color: #d1cccc; "><b>Tramite de Pago No {{ ' '.$datos->consecu_informe." ".$action = empty($rega) ? ' ' : 'Adicio Reg: '.$rega }}</b></td>
      
    </tr>
    @php $s = 0; $sdo = $datos->saldo_viene; @endphp
      @foreach ($rubro as $item)
           
          @foreach ($datos->facturadetas as $fac)
            @if ($item->uso_rubro_id == $fac->uso_rubro_id)
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
              <td class="t1" >{{$item->nombre_uso}} </td>
              <td class="t1" >{{$item->codigo_uso}} </td>
              <td class="colu" style="text-align: center;"></td>
              <td class="colu" style="text-align: center;"></td>
              <td class="colu" ></td>
              <td class="colu" style="text-align: center; ">{{ number_format($item->total_fac)}}</td>
              <td class="colu" style="text-align: center;">{{ number_format($item->total_fac)}}</td>
              <td class="colu" style="text-align: center; "></td>
            </tr>
      @endforeach
    <tr>
      <td class="colu" colspan ="8" style="background-color: #d1cccc;" ></td>
      
    </tr>
    
    @php $sum = 0 @endphp
    @foreach ($rubro as $item)
         @php $sum += $item->total_fac  @endphp
        <tr>
          <td class="t1">{{$item->nombre_uso}}</td>
          <td class="t1">{{$item->codigo_uso}}</td>
          <td class="colu"></td>
          <td class="colu"></td>
          <td class="colu"></td>
          <td class="colu" style="text-align: center; ">{{ number_format($item->total_fac)}}</td>
          <td class="colu" style="text-align: center; ">{{ number_format($item->total_fac)}}</td>
          <td class="colu"></td>
        </tr>
    @endforeach
    
    <tr>
      <td class="colu" style="background-color: #d1cccc;"><strong> Sub Total Uso</strong></td>
      <td class="colu" style="background-color: #d1cccc;"></td>
      <td class="colu" style="background-color: #d1cccc;"></td>
      <td class="colu" style="background-color: #d1cccc;"></td>
      <td class="colu" style="background-color: #d1cccc;"></td>
      <th class="colu" style="background-color: #d1cccc;"></th>
      <th class="colu" style="background-color: #d1cccc;">{{ number_format($sum)}}</th>
      <th class="colu" style="background-color: #d1cccc;">{{number_format($sdo)}}</th>
    </tr>
    <tr>
      <th class="colu" style="background-color: #d1cccc;">TOTAL TRAMITE</th>
      <th class="colu" colspan ="7" style="background-color: #d1cccc; text-align: center;">{{number_format($datos->total)}}</th>
     
    </tr>
    <tr>
      <th class="colu" style="background-color: #d1cccc;">TOTAL</th>
      <td class="t2" style="background-color: #d1cccc;"></td>
      <td class="colu" style="background-color: #d1cccc;"></td>
      <td class="colu" style="background-color: #d1cccc;"></td>
      <td class="colu" style="background-color: #d1cccc;"></td>
      <th class="colu" style="background-color: #d1cccc;">{{ number_format($sum)}}</th>
      <th class="colu" style="background-color: #d1cccc;">{{ number_format($sum)}}</th>
      <th class="colu" style="background-color: #d1cccc;">{{number_format($sdo)}}</th>
    </tr>
    <table>
      @for ($i = 0; $i < $spacio; $i++)
      <tr>
        <td class="" colspan ="8" ></td>
      </tr>
    @endfor
    </table>
      
</table>

<br>
<div style="position: relative;">
  
 @if ($resp == 1)
   <div class="texto-encima3"> _______________________________</div>
    <div class="contenedor"  >
      <img src="{{ public_path('img/ima_acro.png')}}" width="45%" />
      <div class="texto-encima"><strong>{{ $datos->user->name }} </strong> </div>
      <div class="texto-encima2">Firmado Digitalmente por {{ ucwords($datos->user->name) }} Fecha {{$fec}}</div>
    </div>
 @endif
 
<div style="float:left">  @if ($resp == 2) _______________________________ <br> @endif                                         
Supervisor: {{ $datos->user->name }} <br>  
{{ $datos->user->dependencia->nombredepen }}</div> 

<div style="float:right"> _______________________________ <br> 
{{ $dmaestro->presupuesto }} <br>
{{ $dmaestro->cargo_presupuesto  }}</div>
</div>    
</body>

</html>

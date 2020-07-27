<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="{{ public_path('css/stylos_info.css')}}">
    <title>Informe Supervisor</title>
    <style>
      body{
      }
    </style>
   </head>
  <body>
 		<div>
  			<img src="{{ public_path('img/CT-FO-11.jpg')}}" width="100%"  alt="Responsive image ">
  		</div>
      <table>
        <tr>
        <td colspan="4" style="text-align: center" ><strong>INFORME DE SUPERVISIÓN No. {{ $data->consecu_informe}}</strong></td>
        </tr>
      </table>
      <strong>Al</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{":Señor Teniente Coronel Ricardo Jerez Soto"}}<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{"Ordenador del Gasto"}}
      <br> <br>
      <div align="justify" >{{"Con toda atención me permito enviar al señor Teniente Coronel Ricardo Jerez Soto, el informe de supervisión No. $data->consecu_informe  Del contrato No."}} {{$data->contrato->numcontrato}}  Correspondiente {{$data->pago_corresponde_mes}}, de acuerdo con la siguiente información:</div>
      <div align="justify" >{{"Tener en cuenta para el diligenciamiento del informe las instrucciones impartidas en el Manual de Contratación."}}</div>
      <table>
        <tr>
          <td><strong>1.	DATOS GENERALES DEL CONTRATO:</strong>  (De acuerdo con la notificación enviada por la Agencia Logística, se deberán establecer los datos)</td>
          
        </tr>
        <tr>
            <td class="colu"><strong>CONTRATO No.</strong> {{$data->contrato->numcontrato}} </td>
            
        </tr>
        <tr>
            <td ></td>
            
        </tr>
        <tr>
            <td class="colu"><strong>CONTRATISTA:</strong> {{$data->contrato->proveedor->nombre}}</td>
            
        </tr>
        <tr>
            <td ></td>
            
        </tr>
        <tr>
            <td class="colu" align="justify" ><strong>OBJETO:</strong> {{$data->contrato->objetocontrato}}</td>
            
        </tr>
        <tr>
            <td ></td>
            
        </tr>
        <tr>
            <td class="colu" align="justify" ><strong>NOMBRE DEL SUPERVISOR: </strong> {{$data->contrato->supervisor}}</td>
            
        </tr>
        <tr>
            <td ></td>
            
        </tr>
        <tr>
            <td class="colu" align="justify" ><strong>VALOR DEL CONTRATO:</strong>  {{ number_format($data->contrato->valorcontrato) }}</td>
            
        </tr>
        <tr>
            <td ></td>
            
        </tr>
        <tr>
            <td class="colu" align="justify" ><strong>PLAZO DE EJECUCION DEL CONTRATO:</strong>{{$data->contrato->plazoejecucion}}</td>
            
        </tr>
        <tr>
            <td ></td>
            
        </tr>
        <tr>
            <td class="colu" align="justify" ><strong>PRORROGAS, MODIFICACIONES U OTRAS: </strong> Adición 0:</td>
            
        </tr>
        <tr>
            <td ></td>
            
        </tr>
        <tr>
            <td ></td>
            
        </tr>
        <tr>
            <td  align="justify" ><strong>2.	CONTROL OBLIGACIONES Y ENTREGABLES CONTRACTUALES: </strong> </td>
            
        </tr>
        <tr>
            <td  align="justify" >Se recibio lo acordado en el contrato sin ningún inconveniente </td>
            
        </tr>
        <tr>
            <td ></td>
            
        </tr>
        <tr>
            <td  align="justify" >Una vez verifique el pliego de condiciones, oferta y contrato (pagina web, SECOP), proceda a diligenciar el presente cuadro de control de cumplimiento de obligaciones. </td>
            
        </tr>
        <tr>
            <td ><STRong>3.</STRong></td>
            
        </tr>
      </table>
      <table>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="t1">NUMERAL</td>
            <td class="t1">OBLIGACION</td>
            <td class="t1">ENTREGABLE</td>
            <td class="t2">ENE</td>
            <td class="t2">FEB</td>
            <td class="t2">MAR</td>
            <td class="t2">ABR</td>
            <td class="t2">MAY</td>
            <td class="t2">JUN</td>
            <td class="t2">JUL</td>
            <td class="t2">AGO</td>
            <td class="t2">SEP</td>
            <td class="t2">OCT</td>
            <td class="t2">NOV</td>
            <td class="t2">DIC</td>
        </tr>
        <tr>
            <td class="t1">10.1.2</td>
            <td class="t1">Cumplir con el objeto del contratado</td>
            <td class="t1">garantía</td>
            <td class="t2" align="center">{{ $action = (1 >= $data->contrato->num_mes  && 1 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (2 >= $data->contrato->num_mes  && 2 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (3 >= $data->contrato->num_mes  && 3 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (4 >= $data->contrato->num_mes  && 4 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (5 >= $data->contrato->num_mes  && 5 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (6 >= $data->contrato->num_mes  && 6 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (7 >= $data->contrato->num_mes  && 7 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (8 >= $data->contrato->num_mes  && 8 <= $data->mes_ejecucion) ? 'x' : '' }} </td>
            <td class="t2" align="center">{{ $action = (9 >= $data->contrato->num_mes  && 9 <= $data->mes_ejecucion) ? 'x' : '' }} </td>
            <td class="t2" align="center">{{ $action = (10 >= $data->contrato->num_mes  && 10 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (11 >= $data->contrato->num_mes  && 11 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (12 >= $data->contrato->num_mes  && 12 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
        </tr>
        <tr>
            <td class="t1">10.1.3</td>
            <td class="t1">Cumplir con el objeto del contratado</td>
            <td class="t1">cumplimiento</td>
            <td class="t2" align="center">{{ $action = (1 >= $data->contrato->num_mes  && 1 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (2 >= $data->contrato->num_mes  && 2 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (3 >= $data->contrato->num_mes  && 3 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (4 >= $data->contrato->num_mes  && 4 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (5 >= $data->contrato->num_mes  && 5 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (6 >= $data->contrato->num_mes  && 6 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (7 >= $data->contrato->num_mes  && 7 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (8 >= $data->contrato->num_mes  && 8 <= $data->mes_ejecucion) ? 'x' : '' }} </td>
            <td class="t2" align="center">{{ $action = (9 >= $data->contrato->num_mes  && 9 <= $data->mes_ejecucion) ? 'x' : '' }} </td>
            <td class="t2" align="center">{{ $action = (10 >= $data->contrato->num_mes  && 10 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (11 >= $data->contrato->num_mes  && 11 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (12 >= $data->contrato->num_mes  && 12 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
        </tr>
        <tr>
            <td class="t1">10.1.4</td>
            <td class="t1">Cumplir con el objeto del contratado</td>
            <td class="t1">Cumplir con las exigencias del supervisor</td>
            <td class="t2" align="center">{{ $action = (1 >= $data->contrato->num_mes  && 1 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (2 >= $data->contrato->num_mes  && 2 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (3 >= $data->contrato->num_mes  && 3 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (4 >= $data->contrato->num_mes  && 4 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (5 >= $data->contrato->num_mes  && 5 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (6 >= $data->contrato->num_mes  && 6 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (7 >= $data->contrato->num_mes  && 7 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (8 >= $data->contrato->num_mes  && 8 <= $data->mes_ejecucion) ? 'x' : '' }} </td>
            <td class="t2" align="center">{{ $action = (9 >= $data->contrato->num_mes  && 9 <= $data->mes_ejecucion) ? 'x' : '' }} </td>
            <td class="t2" align="center">{{ $action = (10 >= $data->contrato->num_mes  && 10 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (11 >= $data->contrato->num_mes  && 11 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (12 >= $data->contrato->num_mes  && 12 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
        </tr>
        <tr>
            <td class="t1">10.1.5</td>
            <td class="t1">Cumplir con el objeto del contratado</td>
            <td class="t1">Obrar con lealtad y buena fe </td>
            <td class="t2" align="center">{{ $action = (1 >= $data->contrato->num_mes  && 1 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (2 >= $data->contrato->num_mes  && 2 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (3 >= $data->contrato->num_mes  && 3 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (4 >= $data->contrato->num_mes  && 4 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (5 >= $data->contrato->num_mes  && 5 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (6 >= $data->contrato->num_mes  && 6 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (7 >= $data->contrato->num_mes  && 7 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (8 >= $data->contrato->num_mes  && 8 <= $data->mes_ejecucion) ? 'x' : '' }} </td>
            <td class="t2" align="center">{{ $action = (9 >= $data->contrato->num_mes  && 9 <= $data->mes_ejecucion) ? 'x' : '' }} </td>
            <td class="t2" align="center">{{ $action = (10 >= $data->contrato->num_mes  && 10 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (11 >= $data->contrato->num_mes  && 11 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (12 >= $data->contrato->num_mes  && 12 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
        </tr>
        <tr>
            <td class="t1">10.1.6</td>
            <td class="t1">Cumplir con el objeto del contratado</td>
            <td class="t1">Firmar actas de liquidación y recibos a satisfacción</td>
            <td class="t2" align="center">{{ $action = (1 >= $data->contrato->num_mes  && 1 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (2 >= $data->contrato->num_mes  && 2 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (3 >= $data->contrato->num_mes  && 3 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (4 >= $data->contrato->num_mes  && 4 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (5 >= $data->contrato->num_mes  && 5 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (6 >= $data->contrato->num_mes  && 6 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (7 >= $data->contrato->num_mes  && 7 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (8 >= $data->contrato->num_mes  && 8 <= $data->mes_ejecucion) ? 'x' : '' }} </td>
            <td class="t2" align="center">{{ $action = (9 >= $data->contrato->num_mes  && 9 <= $data->mes_ejecucion) ? 'x' : '' }} </td>
            <td class="t2" align="center">{{ $action = (10 >= $data->contrato->num_mes  && 10 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (11 >= $data->contrato->num_mes  && 11 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (12 >= $data->contrato->num_mes  && 12 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
        </tr>
        <tr>
            <td class="t1">10.1.7</td>
            <td class="t1">Cumplir con el objeto del contratado</td>
            <td class="t1">Cumplir con las condiciones del contrato según anexo 1</td>
            <td class="t2" align="center">{{ $action = (1 >= $data->contrato->num_mes  && 1 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (2 >= $data->contrato->num_mes  && 2 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (3 >= $data->contrato->num_mes  && 3 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (4 >= $data->contrato->num_mes  && 4 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (5 >= $data->contrato->num_mes  && 5 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (6 >= $data->contrato->num_mes  && 6 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (7 >= $data->contrato->num_mes  && 7 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (8 >= $data->contrato->num_mes  && 8 <= $data->mes_ejecucion) ? 'x' : '' }} </td>
            <td class="t2" align="center">{{ $action = (9 >= $data->contrato->num_mes  && 9 <= $data->mes_ejecucion) ? 'x' : '' }} </td>
            <td class="t2" align="center">{{ $action = (10 >= $data->contrato->num_mes  && 10 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (11 >= $data->contrato->num_mes  && 11 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
            <td class="t2" align="center">{{ $action = (12 >= $data->contrato->num_mes  && 12 <= $data->mes_ejecucion) ? 'x' : '' }}</td>
        </tr>
      </table>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Porcentaje cumplimiento Avance %</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$data->porcentaje_cumplimiento}}% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Demora _____________%                       
      <br><br>
      <strong>4.	NOVEDADES DE INCUMPLIMIENTO EN LA EJECUCION</strong> <br>
        N/A
      <br><br>
      <strong>5.	CONTROL DE PAGOS</strong> 
      <br><br>
      <table>
          <tr>
              <td colspan="2" class="colu">Valor Total del contrato</td>
              <td colspan="3" class="colu">{{ number_format($data->contrato->valorcontrato)}}</td>
          </tr>
          @php $c = 0; $rega = '' @endphp
          @foreach ($data->factudetadis as $itemadi)
          @php $c += 1; $fe = new DateTime($itemadi->fechaadicion);  $fea = $fe->format('d/m/Y'); $rega =$itemadi->registroadicion @endphp
          <tr>
            <td colspan="2" class="colu" >{{'Adicion N° '.$c}}</td>
            <td colspan="3" class="colu">{{ number_format($itemadi->valoradicion) }}</td>
            
          </tr>
        @endforeach
         
          <tr>
            <td colspan="2" class="colu">TOTAL</td>
            <td colspan="3" class="colu">{{ number_format($data->gran_total) }}</td>
          </tr>
         
          <tr>
            <td colspan="5" class="colu" style="text-align: center">PAGOS</td>
            
          </tr>
          <tr>
            <td colspan="3" class="colu"></td>
            <td  class="colu">SALDO VIENE</td>
            <td  class="colu">{{ number_format($data->saldo_viene) }}</td>
          </tr>
          <tr>
            <td colspan="2" class="colu" ><strong>No. Factura y/o Cuenta de cobro</strong> </td>
            <td  class="colu" ><strong>Fecha</strong> </td>
            <td  class="colu" ><strong>Valor</strong> </td>
            <td  class="colu" ><strong>Saldo</strong></td>
          </tr>
          @php $s = 0; $sdo = $data->saldo_viene; @endphp
          @foreach ($facdetas as $fac)
             @php $s += $fac->valorfac; $sdo -= $fac->valorfac;
                $fe = new DateTime($fac->fechafac);  $fefa = $fe->format('d/m/Y');
              @endphp
            <tr>
              <td colspan="2" class="colu" >{{'FACTURA: '.$fac->numfac}}</td>
              <td  class="colu" >{{ $fefa }}</td>
              <td  class="colu" >{{ number_format($fac->valorfac) }}</td>
              <td  class="colu" >{{ number_format($sdo)}}</td>
            </tr>
          @endforeach
     
      </table>
      
      Nota: El supervisor verificará que el contratista realice el cargue de las facturas en el SECOP II. <br>

      <strong>6.	INFORMACIÓN FIDUCIAS ( Cuando aplique)</strong> <br>
        N/A
      <br><br>
      <strong>7.	INFORMACIÓN PERSONAL CONTRATADO (Cuando aplique)</strong> <br>     
            El servicio fue desarrollado por el personal asignado por la empresa sin novedad especial <br><br>

      <strong>8. RECOMENDACIONES </strong> <br>
        Ninguna <br><br>

    _______________________________
    <div>{{ $data->contrato->supervisor }}</div>
    <div>Supervisor del Contrato</div>
        
  		
  	
   
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
  </body>

</html>
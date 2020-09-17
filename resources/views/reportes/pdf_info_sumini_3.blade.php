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
        <td colspan="4" style="text-align: center" ><strong>INFORME DE SUPERVISIÓN No. {{ $data->sum_conse}}</strong></td>
        </tr>
      </table>
      <strong>Al</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{":".$data->director}}<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$data->cargo_director}}
      <br> <br>
      <div align="justify" >{{"Con toda atención me permito enviar al señor $data->director, el informe de supervisión No. $data->consecu_informe  Del contrato No."}} {{$data->contrato->numcontrato}}  Correspondiente {{$data->corresponde_periodo}}, de acuerdo con la siguiente información:</div>
      <div align="justify" >{{"Tener en cuenta para el diligenciamiento del informe las instrucciones impartidas en el Manual de Contratación."}}</div>
      <table>
        <tr>
          <td colspan="2"><strong>1.	DATOS GENERALES DEL CONTRATO:</strong>  (De acuerdo con la notificación enviada por la Agencia Logística, se deberán establecer los datos)</td>
          
        </tr>
        <tr>
            <td colspan="2" class="colu"><strong>CONTRATO No.</strong> {{$data->contrato->numcontrato}} </td>
            
        </tr>
        <tr>
            <td colspan="2"></td>
            
        </tr>
        <tr>
            <td colspan="2" class="colu"><strong>CONTRATISTA:</strong> {{$data->contrato->proveedor->nombre}}</td>
            
        </tr>
        <tr>
            <td colspan="2"></td>
            
        </tr>
        <tr>
            <td colspan="2" class="colu" align="justify" ><strong>OBJETO:</strong> {{$data->contrato->objetocontrato}}</td>
            
        </tr>
        <tr>
            <td colspan="2"></td>
            
        </tr>
       
        <tr>
            <td colspan="2" class="colu" align="justify" ><strong>VALOR DEL CONTRATO:</strong>  {{ number_format($data->contrato->valorcontrato) }}</td>
            
        </tr>
        <tr>
            <td colspan="2"></td>
            
        </tr>
        <tr>
            <td colspan="2" class="colu" align="justify" ><strong>PLAZO DE EJECUCION DEL CONTRATO:</strong>{{$data->contrato->plazoejecucion}}</td>
            
        </tr>
        <tr>
            <td colspan="2"></td>
            
        </tr>
        <tr>
            <td colspan="2" class="colu" align="justify" ><strong>MODIFICACIONES : </strong> SI___ No_X_</td>
            
        </tr>
        <tr>
            <td colspan="2"></td>
            
        </tr>
        <tr>
          <td class="colu" align="center">TIPO</td>
          <td class="colu"></td>
      </tr>
      @php $c = 0; @endphp
      @foreach ($data->informeadis as $itemadi)
        @php $c += 1 @endphp
        <tr>
          <td class="colu" align="justify">{{'Adicion N° '.$c}}</td>
          <td class="colu" align="justify">{{ number_format($itemadi->valoradicion) }}</td>
        </tr>
      @endforeach
        <tr>
          <td class="colu" align="justify"></td>
          <td class="colu" align="justify"></td>
        </tr>
        <tr>
            <td colspan="2"></td>
            
        </tr>
        <tr>
            <td colspan="2" align="justify" ><strong>2.	CONTROL OBLIGACIONES Y ENTREGABLES CONTRACTUALES: </strong> </td>
            
        </tr>
        <tr>
            <td colspan="2" align="justify" >Se recibio lo acordado en el contrato sin ningún inconveniente </td>
            
        </tr>
        <tr>
            <td colspan="2"></td>
            
        </tr>
        <tr>
            <td colspan="2" align="justify" >Una vez verifique el pliego de condiciones, oferta y contrato (pagina web, SECOP), proceda a diligenciar el presente cuadro de control de cumplimiento de obligaciones. </td>
            
        </tr>
       
      </table>
      <table>
        <tr>
            <td ></td>
            <td ></td>
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
            <td colspan="3" class="t1" align="center" style="background-color:  #dedbda ">DESCRIPCION</td>
            <td colspan="12" class="t1" align="center" style="background-color:  #dedbda ">PLAZO EJECUCION</td>
            
         </tr>
        <tr>
            <td class="t2" style="background-color:  #dedbda ">NUMERAL</td>
            <td class="tn" style="background-color:  #dedbda ">OBLIGACION</td>
            <td class="t1" style="background-color:  #dedbda ">ENTREGABLE</td>
            <td class="t2" style="background-color:  #dedbda ">ENE</td>
            <td class="t2" style="background-color:  #dedbda ">FEB</td>
            <td class="t2" style="background-color:  #dedbda ">MAR</td>
            <td class="t2" style="background-color:  #dedbda ">ABR</td>
            <td class="t2" style="background-color:  #dedbda ">MAY</td>
            <td class="t2" style="background-color:  #dedbda ">JUN</td>
            <td class="t2" style="background-color:  #dedbda ">JUL</td>
            <td class="t2" style="background-color:  #dedbda ">AGO</td>
            <td class="t2" style="background-color:  #dedbda ">SEP</td>
            <td class="t2" style="background-color:  #dedbda ">OCT</td>
            <td class="t2" style="background-color:  #dedbda ">NOV</td>
            <td class="t2" style="background-color:  #dedbda ">DIC</td>
        </tr>
        @foreach ($data->obliga_sumins as $item)
            <tr>
                <td class="t2">{{ $item->numeral }}</td>
                <td class="tn">{{ $item->obligacion_deta }}</td>
                <td class="t1">{{ $item->entregable }}</td><!-- $action = (4 >= $data->contrato->num_mes  && 4 <= $data->mes_ejecucion) ? 'x' : '' -->
                <td class="t2" align="center">{{ $action = (1 == $data->mes_ejecucion) ? $item->confirmar : '' }}</td>
                <td class="t2" align="center">{{ $action = (2 == $data->mes_ejecucion) ? $item->confirmar : '' }}</td>
                <td class="t2" align="center">{{ $action = (3 == $data->mes_ejecucion) ? $item->confirmar : '' }}</td>
                <td class="t2" align="center">{{ $action = (4 == $data->mes_ejecucion) ? $item->confirmar : '' }}</td>
                <td class="t2" align="center">{{ $action = (5 == $data->mes_ejecucion) ? $item->confirmar : '' }}</td>
                <td class="t2" align="center">{{ $action = (6 == $data->mes_ejecucion) ? $item->confirmar : '' }}</td>
                <td class="t2" align="center">{{ $action = (7 == $data->mes_ejecucion) ? $item->confirmar : '' }}</td>
                <td class="t2" align="center">{{ $action = (8 == $data->mes_ejecucion) ? $item->confirmar : '' }} </td>
                <td class="t2" align="center">{{ $action = (9 == $data->mes_ejecucion) ? $item->confirmar : '' }} </td>
                <td class="t2" align="center">{{ $action = (10 == $data->mes_ejecucion) ? $item->confirmar : '' }}</td>
                <td class="t2" align="center">{{ $action = (11 == $data->mes_ejecucion) ? $item->confirmar : '' }}</td>
                <td class="t2" align="center">{{ $action = (12 == $data->mes_ejecucion) ? $item->confirmar : '' }}</td>
            </tr>
          @endforeach
       
      </table>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Porcentaje cumplimiento Avance %</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  {{ $action = ($data->porcentaje_cumplimiento < 0) ? "0" : $data->porcentaje_cumplimiento }}% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Demora _____________%                       
      <br><br>
      <STRong>3. CUMPLIMIENTO DE LOS RIESGOS PREVISIBLES DEL CONTRATO.</STRong><br>
       <span align="justify" >Seguimiento y monitoreo delos riesgos establecidos para la etapa de ejecución del contrato:</span> 
      <table>
        <tr>
         <td class="t2" >No</td>
         <td class="t1" >TIPO</td>
         <td class="t1" >DESCRIPCION</td>
         <td class="t1" >TRATAMIENTO</td>
         <td class="t1" >RESPONSABLE</td>
         <td class="t1" >PERIODICIDAD</td>
      </tr>
      @php $c= 0; @endphp
      @foreach ($data->riesgos_sumins as $item)
          @php $c += 1; @endphp
          <tr>
            <td class="t2" >{{ $c }}</td>
            <td class="t1" >{{$item->tipo}}</td>
            <td class="t1" >{{$item->descripcion}}</td>
            <td class="t1" >{{$item->tratamiento}}</td>
            <td class="t1" >{{$item->responsable}}</td>
            <td class="t1" >{{$item->periodicidad}}</td>
          </tr>
      @endforeach
      </table>
      <strong>4.	NOVEDADES DE INCUMPLIMIENTO EN LA EJECUCION</strong> <br>
       {{$data->novedad}}
      <br><br>
      <strong>5.	CONTROL DE PAGOS</strong> 
      <br><br>
      <table>
          <tr>
              <td colspan="2" class="colu">Valor Total del contrato</td>
              <td colspan="4" class="colu">{{ number_format($data->contrato->valorcontrato)}}</td>
          </tr>
          @php $c = 0; $rega = '' @endphp
          @foreach ($data->informeadis as $itemadi)
          @php $c += 1; $fe = new DateTime($itemadi->fechaadicion);  $fea = $fe->format('d/m/Y'); $rega =$itemadi->registroadicion @endphp
          <tr>
            <td colspan="2" class="colu" >{{'Adicion N° '.$c}}</td>
            <td colspan="3" class="colu">{{ number_format($itemadi->valoradicion) }}</td>
            
          </tr>
        @endforeach
         
          <tr>
            <td colspan="2" class="colu">TOTAL</td>
            <td colspan="4" class="colu">{{ number_format($data->gran_total) }}</td>
          </tr>
         
          <tr>
            <td colspan="6" class="colu" style="text-align: center">PAGOS</td>
            
          </tr>
          <tr>
            <td colspan="3" class="colu"></td>
            <td  class="colu">SALDO VIENE</td>
            <td  colspan= "2" class="colu">{{ number_format($data->saldo_viene + $data->total_info) }}</td>
          </tr>
          <tr>
            <td colspan="2" class="colu" style="background-color:  #dedbda "><strong>No. Factura y/o Cuenta de cobro</strong> </td>
            <td  class="colu" style="background-color:  #dedbda " ><strong>Fecha</strong> </td>
            <td  class="colu" style="background-color:  #dedbda "><strong>Valor</strong> </td>
            <td  class="colu" style="background-color:  #dedbda "><strong>Saldo</strong></td>
            <td  class="t3" style="background-color:  #dedbda " align="justify"><strong>Con Cargo al contrato Interadministrativo No. {{$data->contrato->concargo->detalle_inter}} </strong></td>
          </tr>
          @php $s = 0; $sdo = $data->saldo_viene+ $data->total_info; @endphp
          @foreach ($datofac as $fac)
             @php $s += $fac->valorfac; $sdo -= $fac->valorfac;
                $fe = new DateTime($fac->fechafac);  $fefa = $fe->format('d/m/Y');
              @endphp
            <tr>
              <td colspan="2" class="colu" >{{'FACTURA: '.$fac->numfac}}</td>
              <td  class="colu" >{{ $fefa }}</td>
              <td  class="colu" >{{ number_format($fac->valorfac) }}</td>
              <td  class="colu" >{{ number_format($sdo)}}</td>
              <td  class="colu" ></td>
            </tr>
          @endforeach
     
      </table>
      
      Nota: El supervisor verificará que el contratista realice el cargue de las facturas en el SECOP II. <br>

      <strong>6.	INFORMACIÓN FIDUCIAS ( Cuando aplique)</strong> <br>
       {{$data->fiducia}}
      <br><br>
      <strong>7.	INFORMACIÓN PERSONAL CONTRATADO (Cuando aplique)</strong> <br>     
      {{$data->infopersonal}} 
      <br><br>
      <strong>8. INFORMACION AIU </strong> <br>
      {{$data->infoaiu}} 
      <br><br>
      <strong>9. RECOMENDACIONES </strong> <br>
      {{$data->recomendacion}}
      <br><br>
      
      <div class="centra_div">
          <div class="texto-encima3"> _______________________________</div>
          <div class="contenedor"  >
              <img src="{{ public_path('img/ima_acro.png')}}" width="45%" />
              <div class="texto-encima"><strong>{{ $data->contrato->supervisor }} </strong> </div>
              <div class="texto-encima2">Firmado Digitalmente por {{ ucwords($data->contrato->supervisor) }} Fecha {{$fec}}</div>
          </div>
      
          <div  >  
            <div>{{ $data->contrato->supervisor }}</div>
            <div>Supervisor del Contrato No {{$data->contrato->numcontrato}} </div>
          </div>
       </div>
        
  		
  	
   
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
  </body>

</html>
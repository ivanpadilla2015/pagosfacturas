@extends('layouts.admin')

@section('style')
<style>
.bg-transparent:hover {
    color: #FF0000;
}

.color {
    color: #fa0404;
}
</style>    
@endsection

@section('content')
    <div  class="container mt-2  ">
        <div class="row">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-8">
                        <div class="card">
                          <div class="card-body">
        
                                                      
                            <div v-if="datos != ''">
                                <div class="border border-primary rounded m-1 pl-3 bg-light ">
                                    <div class="form-row">
                                      <div class="col">
                                        <strong>Pago No : </strong> <small>{{ $dato->id}}</small>
                                      </div>
                                      <div class="col">
                                        <strong>Valor a Pagar : </strong> <small>{{ number_format($dato->total)}}</small>
                                      </div>
                                      <div class="col">
                                        <strong>F. Pago : </strong> <small>{{ $dato->fecha_pago}}</small>
                                      </div>
                                    </div>
                                    <div class="form-row ">
                                      <div class="col">
                                        <strong>Contrato No : </strong> <small>{{ $dato->contrato->numcontrato}}</small>
                                      </div>
                                      <div class="col">
                                        <strong>Valor Contrato : </strong> <small>{{number_format($dato->contrato->valorcontrato)}}</small>
                                      </div>
                                      <div class="col">
                                        <strong>Saldo Cto : </strong> <small>{{ number_format($dato->contrato->saldo)}}</small>
                                      </div>
                                    </div>
                                      <div class="form-row  rounded">
                                        <div class="col">
                                          <strong>Fecha Cto : </strong> <small>{{ $dato->contrato->fechacontrato}}</small>
                                        </div>
                                        <div class="col">
                                          <strong>Prov: : </strong> <small>{{ $dato->contrato->proveedor->nombre}}</small>
                                        </div>
                                        <div class="col">
                                          <strong>Reg Pres : </strong> <small>{{ $dato->contrato->registro_pres_inic }}</small>
                                        </div>
                                      </div>

                                </div>
                                <div class="float-right my-1">
                                  
                                  <a href="{{ route('verinforme', $dato->id )}}" class="btn btn-info btn-sm ml-2">Informe Supervisor</a>
                                </div>
                                <div class="float-right my-1">
                                 <a href="{{ route('verconpago', $dato->id )}}"  class="btn btn-info btn-sm ">Control Pago</a>
                                  <!--<button type="button" wire:click="Pdfxnumeropago()" class="btn btn-info ">Vista Previa</button>-->
                                </div>
                                 <!--  ****************** Table *****************************-->
                                   <table class="table table-sm mt-2">
                                    <thead class="thead-light" >
                                      <tr>
                                        <th scope="col">Factura</th>
                                        <th scope="col">Fecha</th>
                                        <th scope="col">Dependencia</th>
                                        <th scope="col">Uso</th>
                                        <th scope="col">Valor</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                      <?php $sum = 0; ?>
                                       @foreach ($dato->facturadetas as $item)
                                           <?php $sum += $item->valorfac ?>
                                          <tr >
                                            <td>{{ $item->numfac }}</th>
                                            <td>{{ $item->fechafac }}</td>
                                            <td>{{ $item->dependencia->nombredepen }}</td>
                                            <td class="col-sm-5">{{ $item->rubro->nombrerubro }}</td>
                                            <td>{{ number_format($item->valorfac) }}</td>
                                          </tr>
                                       @endforeach 
                                            <tr>
                                              <td colspan="3"></th>
                                              <td class="text-right"><strong>Total:</strong></td>
                                              <td>{{ number_format($sum) }}</td>
                                            </tr>
                                       
                                        
                                     </tbody>
                                  </table>
                                <!--*******************************************************--> 
                             </div><!-- Fin condicional -->
                                
                          </div><!-- card-body -->
                        </div><!-- card -->
                    </div><!-- col-8 -->
                </div><!--row d-flex justify-content-center -->
            </div><!--container -->
        </div><!--row-->
    </div>
 @endsection
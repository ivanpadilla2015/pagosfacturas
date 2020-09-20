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
                                <!--<div class="float-right my-1">
                                  
                                  <a href="{{ route('verinforme', $dato->id )}}" class="btn btn-info btn-sm ml-2">Informe Supervisor</a>
                                </div> -->
                                
                                  <div class="form-inline d-flex justify-content-center">
                                    <form action="{{ route('verconpagonew') }}" method="GET" class="form-inline">
                                      @csrf
                                      <div class="form-group">
                                        <label>Espacios </label>
                                        <input type="number" name="space" value="0" step="10" class="form-control form-control-sm col-4">
                                      </div>
                                      <div class="form-group">
                                        <label>Firmado </label>
                                        <select name="resp" class="form-control form-control-sm ">
                                          <option value="1">Si</option>
                                          <option value="2">No</option>
                                        </select>
                                      </div>
                                      <input type="hidden" name="id" value="{{$dato->id}}">
                                      <button type="submit" class="btn btn-info btn-sm ml-5">Control Pago New</button>
                                    </form>
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
                                            <td class="col-sm-5">{{ $item->uso_rubro->nombre_uso }}</td>
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
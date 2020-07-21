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
    <div id="app" class="container mt-2  ">
        <div class="row">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-8">
                        <div class="card">
                          <div class="card-body">
        
                            <div class="form-group col">
                                <label >Pago No:</label>
                                
                                <select  class="form-control" v-model="pagoid" @change="consulcon(pagoid)">
                                    <option value="0">Seleccione</option>
                                    @foreach ($contra as $con)
                                      <option value="{{ $con['id'] }}">{{"Pago No: ".$con['id']." Cto : ".$con->contrato->numcontrato." Prov.: ".$con->contrato->proveedor->nombre."  Valor: ".number_format($con->total) }}</option>
                                    @endforeach
                                  </select>
                            </div>
                            
                            <div v-if="datos != ''">
                                <div class="border border-primary rounded m-1 pl-3 bg-light ">
                                    <div class="form-row">
                                      <div class="col">
                                        <strong>Pago No : </strong> <small>@{{ datos[0].id}}</small>
                                      </div>
                                      <div class="col">
                                        <strong>Valor a Pagar : </strong> <small>@{{ datos[0].total}}</small>
                                      </div>
                                      <div class="col">
                                        <strong>F. Pago : </strong> <small>@{{ datos[0].fecha_pago}}</small>
                                      </div>
                                    </div>
                                    <div class="form-row ">
                                      <div class="col">
                                        <strong>Contrato No : </strong> <small>@{{ datos[0].contrato.numcontrato}}</small>
                                      </div>
                                      <div class="col">
                                        <strong>Valor Contrato : </strong> <small>@{{ datos[0].contrato.valorcontrato}}</small>
                                      </div>
                                      <div class="col">
                                        <strong>Saldo Cto : </strong> <small>@{{ datos[0].contrato.saldo}}</small>
                                      </div>
                                    </div>
                                      <div class="form-row  rounded">
                                        <div class="col">
                                          <strong>Fecha Cto : </strong> <small>@{{ datos[0].contrato.fechacontrato}}</small>
                                        </div>
                                        <div class="col">
                                          <strong>Prov: : </strong> <small>@{{ datos[0].contrato.proveedor.nombre}}</small>
                                        </div>
                                        <div class="col">
                                          <strong>Reg Pres : </strong> <small>@{{ datos[0].contrato.registro_pres_inic }}</small>
                                        </div>
                                      </div>

                                </div>
                                <div class="float-right my-1">
                                  <a href="{{ route('pdfinfosuper')}}" class="btn btn-info btn-sm ml-2">Informe Supervisor</a>
                                </div>
                                <div class="float-right my-1">
                                  <a href="{{ route('pdfpagxnum')}}" class="btn btn-info btn-sm ">Control Pago</a>
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
                                      <tr v-for="(item, index) in datos[0].facturadetas" :key="index">
                                          <td>@{{ item.numfac }}</th>
                                          <td>@{{ item.fechafac }}</td>
                                          <td>@{{ item.dependencia.nombredepen }}</td>
                                          <td class="col-sm-5">@{{ item.rubro.nombrerubro }}</td>
                                          <td>@{{ item.valorfac.toLocaleString() }}</td>
                                        </tr>
                                      
                                          <tr>
                                            <td colspan="3"></th>
                                            <td class="text-right"><strong>Total:</strong></td>
                                            <td>@{{ totalizar().toLocaleString() }}</td>
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
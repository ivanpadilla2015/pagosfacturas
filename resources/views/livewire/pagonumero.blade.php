<div>
    <div class="row">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-8">
                    <div class="card">
                      <div class="card-body">

                        <div class="form-group col">
                            <label >Pago No:</label>
                            <select wire:model="pago_id"  class="form-control" >
                                <option value="0" wire:click="consulcon({{0}})">Seleccione</option>
                                @foreach ($contra as $con)
                                  <option value="{{ $con['id'] }}" wire:click="consulcon({{$con['id']}})">{{"Pago No: ".$con['id']." Cto : ".$con->contrato->numcontrato." Prov.: ".$con->contrato->proveedor->nombre."  Valor: ".number_format($con->total) }}</option>
                                @endforeach
                              </select>
                        </div>
                        @if ($data)
                              <div class="border border-primary rounded m-1 pl-3 bg-light ">
                                <div class="form-row">
                                  <div class="col">
                                    <strong>Pago No : </strong> <small>{{ $data->id}}</small>
                                  </div>
                                  <div class="col">
                                    <strong>Valor a Pagar : </strong> <small>{{ number_format($data->total,2)}}</small>
                                  </div>
                                  <div class="col">
                                    <strong>F. Pago : </strong> <small>{{ $data->fecha_pago}}</small>
                                  </div>
                                  
                                </div>
                            
                                <div class="form-row ">
                                  <div class="col">
                                    <strong>Contrato No : </strong> <small>{{ $data->contrato->numcontrato}}</small>
                                  </div>
                                  <div class="col">
                                    <strong>Valor Contrato : </strong> <small>{{ number_format($data->contrato->valorcontrato,2)}}</small>
                                  </div>
                                  <div class="col">
                                    <strong>Saldo Cto : </strong> <small>{{ number_format($data->contrato->saldo,2)}}</small>
                                  </div>
                                  
                                </div>
                                <div class="form-row  rounded">
                                  <div class="col">
                                    <strong>Fecha Cto : </strong> <small>{{ $data->contrato->fechacontrato}}</small>
                                  </div>
                                  <div class="col">
                                    <strong>Prov: : </strong> <small>{{($data->contrato->proveedor->nombre)}}</small>
                                  </div>
                                  <div class="col">
                                    <strong>Reg Pres : </strong> <small>{{ $data->contrato->registro_pres_inic}}</small>
                                  </div>
                                </div>
                            </div>
                            <div class="float-right my-1">
                             <!-- <button type="button" wire:click="Pdfxnumeropago()" class="btn btn-info ">Vista Previa</button>-->
                            </div>
                            <!-- ****************** Table *****************************-->
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
                                        @foreach ($data->facturadetas as $item)
                                            <?php $sum += $item->valorfac; ?>
                                          <tr>
                                            <td>{{ $item->numfac }}</th>
                                            <td>{{ $item->fechafac }}</td>
                                            <td>{{ $item->dependencia->nombredepen }}</td>
                                            <td class="col-sm-5">{{ $item->uso_rubro->nombre_rubro }}</td>
                                            <td>{{ number_format($item->valorfac,2) }}</td>
                                          </tr>
                                        @endforeach
                                            <tr>
                                              <td colspan="3"></th>
                                              <td class="text-right"><strong>Total:</strong></td>
                                              <td>{{ number_format($sum,2) }}</td>
                                            </tr>
                                       </tbody>
                                    </table>
                            <!--*******************************************************--> 
                        @endif
                            
                      </div><!-- card-body -->
                    </div><!-- card -->
                </div><!-- col-8 -->
            </div><!--row d-flex justify-content-center -->
        </div><!--container -->
    </div><!--row-->
</div>

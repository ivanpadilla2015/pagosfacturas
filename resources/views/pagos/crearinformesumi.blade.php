                <h5 class="card-title mr-1">Contrato:</h5> 
                <div class=" form-inline">
                    <input class="form-control form-control-sm " type="text" wire:model="numcontrato" wire:keydown.enter="consulcontra()" autofocus  required >
                    <button wire:click="consulcontra()"   class="btn btn-primary btn-sm mt-1 ml-1" title="Bucar Contrato">Buscar</button>
                </div>
                
                @error('numcontrato')
                  <small class=" form-text text-danger">{{ $message }}</small>
                @enderror
                @if ($data) 
                        <div class="border border-primary rounded m-1 pl-3 bg-light "> 
                            <div class="form-row ">
                                <div class="col">
                                    <strong>Contrato No : </strong> <small>{{ $data->numcontrato}}</small>
                                </div>
                                <div class="col">
                                    <strong>Valor Contrato : </strong> <small>{{ number_format($data->valorcontrato,2)}}</small>
                                </div>
                                <div class="col">
                                    <strong>Saldo Cto : </strong> <small>{{ number_format($data->saldo,2)}}</small>
                                </div>
                            </div>
                            <div class="form-row  rounded">
                                <div class="col">
                                <strong>Fecha Cto : </strong> <small>{{ $data->fechacontrato}}</small>
                                </div>
                                <div class="col">
                                <strong>Prov: : </strong> <small>{{($data->proveedor->nombre)}}</small>
                                </div>
                                <div class="col">
                                <strong>Reg Pres : </strong> <small>{{ $data->registro_pres_inic}}</small>
                                </div>
                            </div>
                        </div>
                        <div class="border border-primary rounded m-1 pl-3 bg-light "> 
                            
                                <strong>Crear Informe No:</strong><strong class="ml-2 text-danger">{{++$data->sum_conse}}</strong>
                                <button wire:click="crearinforme()" onclick="confirm('Confirma Crear Informe?') || event.stopImmediatePropagation()" class="btn btn-success btn-sm float-right m-2">Crear Informe</button> <br>
                                <div class="row">
                                    <div class="col">
                                      <label>Correspondiente</label>  
                                      <input type="text" wire:model="correspondiente" class="form-control" placeholder="correspondeinte ...">
                                      @error('correspondiente') <span class="text-danger">{{$message}}</span>@enderror
                                    </div>
                                    <div class="col">
                                      <label>Mes Ejecucion</label>
                                      <select wire:model="meje" class="form-control">
                                        <option value="0">Seleccione</option>
                                        <option value="1">Enero</option>
                                        <option value="2">Febrero</option>
                                        <option value="3">Marzo</option>
                                        <option value="4">Abril</option>
                                        <option value="5">Mayo</option>
                                        <option value="6">Junio</option>
                                        <option value="7">Julio</option>
                                        <option value="8">Agosto</option>
                                        <option value="9">Septiembre</option>
                                        <option value="10">Octubre</option>
                                        <option value="11">Noviembre</option>
                                        <option value="12">Diciembre</option>
                                     </select>
                                      @error('meje') <span class="text-danger">{{$message}}</span>@enderror
                                   </div>
                                  </div>
                            
                            <strong>Pagos Realizados </strong>
                            <table class="table table-sm">
                                <thead>
                                  <tr>
                                    <th scope="col">#</th>
                                    <th scope="col" class="text-center">Ctl Pago</th>
                                    <th scope="col">Fecha</th>
                                    <th scope="col">Valor</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    @php $c = 0; $s= 0;  @endphp
                                    @foreach ($datopago as $item)
                                        @php $c +=1 ;  $s +=$item['total']; @endphp
                                        <tr>
                                            <th scope="row">{{$c}}</th>
                                            <td class="text-center">{{ $item['id'] }} </td>
                                            <td>{{ $item['fecha_pago'] }}</td>
                                            <td>{{ number_format($item['total'])  }}</td>
                                          
                                        </tr>
                                    @endforeach
                                        <tr>
                                            <th colspan="3" class="text-right">Total</th>
                                            <td>{{ number_format($s) }}</td>
                                            
                                        </tr>

                                </tbody>
                              </table>
                            
                        </div>
                        <strong>Facturas de los pagos </strong>
                            <table class="table table-sm">
                                <thead>
                                  <tr>
                                    <th scope="col">#</th>
                                    <th scope="col" class="text-center">Factura</th>
                                    <th scope="col">Fecha</th>
                                    <th scope="col">Valor</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    @php $c = 0; $s= 0;  @endphp
                                    @foreach ($datofac as $item)
                                        @php $c +=1 ;  $s +=$item['valorfac']; @endphp
                                        <tr>
                                            <th scope="row">{{$c}}</th>
                                            <td class="text-center">{{ $item['numfac'] }} </td>
                                            <td>{{ $item->fechafac }}</td>
                                            <td>{{ number_format($item['valorfac'])  }}</td>
                                            <td>{{ $item->dependencia->nombredepen }}</td>
                                        </tr>
                                    @endforeach
                                        <tr>
                                            <th colspan="3" class="text-right">Total</th>
                                            <td>{{ number_format($s) }}</td>
                                            
                                        </tr>

                                </tbody>
                              </table>
                        
                @endif
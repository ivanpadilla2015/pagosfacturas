<div>
    <div class="row">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-8">
                    <div class="card">
                      <div class="card-body">

                        <div class="form-group col">
                            <label >Contrato</label>
                            <select wire:model="contrato_id"  class="form-control" >
                                <option value="0" wire:click="consulcon({{0}})">Seleccione</option>
                                @foreach ($contra as $con)
                                  <option value="{{ $con['id'] }}" wire:click="consulcon({{$con['id']}})">{{ $con['numcontrato']." ".$con->proveedor->nombre."  Saldo: ".number_format($con->saldo) }}</option>
                                @endforeach
                              </select>
                        </div>
                        @if ($data) 
                            <strong class="mr-2">Contrato : </strong>{{$data->numcontrato}} <strong class="mr-2 ml-5">Valor : </strong>{{number_format($data->valorcontrato) }} <strong class="mr-2 ml-5">Saldo : </strong><span>{{number_format($data->saldo)}}</span><br />
                            <strong class="mr-2">Proveedor : </strong><span>{{$data->proveedor->nombre}}</span><br />
                            
                            <div class="form-row">
                                <div class="col-2">
                                  <strong>Pago No</strong>
                                  <input type="text" name="pagos" value="{{++$data->pagos}}" class="form-control" placeholder="Pago num">
                                </div>
                                <div class="col-4">
                                    <strong>Reg. Pres</strong>
                                    <input name="registro_pres_inic" value="{{ $data->registro_pres_inic }}" type="text" class="form-control" placeholder="Registro Press">
                                </div>
                                <div class="col">
                                  <strong>Inter Admin</strong>
                                  <input name="interadmi" value="{{ $data->interadmi }}" type="text" class="form-control" placeholder="Inter">
                                </div>
                              </div>
                            <strong >Objeto: </strong> 
                            <div class="alert alert-primary" role="alert">
                                    {{ $data->objetocontrato }}
                            </div>
                            <div class="form-row mb-2 pb-2 bg-info">
                                <div class="col">
                                  <label>Pago Corresponde</label>
                                  <input type="text" wire:model="pago_corresponde_mes" class="form-control" placeholder="Correspondiente a?">
                                  @error('pago_corresponde_mes') <span class="text-danger">{{$message}}</span>@enderror
                                </div>
                                <div class="col">
                                  <label>Mes Ejecucion</label>
                                  <select wire:model="mes_ejecucion" class="form-control">
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
                                @error('mes_ejecucion') <span class="text-danger">{{$message}}</span>@enderror
                                </div>
                                <div class="col">
                                  <label>Porcentaje Cumplimiento</label>
                                  <input type="text" wire:model="porcentaje_cumplimiento" class="form-control" placeholder="Porcentaje Cumplido">
                                </div>
                            </div>
                            <form wire:submit.prevent="agregarfact">
                              <div class="form-row">
                                <div class="col">
                                  <input wire:model="fact.numfac" type="text" class="form-control" placeholder="Num Factura">
                                 @error('numfac') <span class="text-danger">{{$message}}</span>@enderror
                                </div>
                                <div class="col">
                                  <input wire:model="fact.fechafac" type="date" class="form-control" placeholder="Fecha Fac">
                                  @error('fact.fechafac') <span class="text-danger">{{$message}}</span>@enderror
                                </div>
                                <div class="col">
                                  <input wire:model="fact.valorfac" type="text" class="form-control" placeholder="Valor Fac">
                                  @error('fact.valorfac') <span class="text-danger">{{$message}}</span>@enderror
                                </div>
                                <div class="col">
                                  <select wire:model="fact.dependencia_id"  class="form-control" >
                                    <option value="0">Seleccione</option>
                                    @foreach ($depen as $depe)
                                      <option value="{{ $depe['id'] }}"  >{{ $depe['nombredepen'] }}</option>
                                    @endforeach
                                  </select>
                                  @error('fact.dependencia_id') <span class="text-danger">{{$message}}</span>@enderror
                                </div>
                                <div class="col">
                                  <select wire:model="fact.rubro_id"  class="form-control" id="producto"   >
                                    <option value="0">Seleccione</option>
                                    @foreach ($usos as $uso)
                                      <option value="{{ $uso['id'] }}"  >{{ $uso['nombrerubro'] }}</option>
                                    @endforeach 
                                  </select>
                              </div>

                              </div><!--  fin form-row -->
                            
                              <button type="submit" class="btn btn-primary btn-sm mt-2" >Add Fac</button>
                            </form>
                            @if ($lisfact)
                            
                            <div class="float-right">
                              <button wire:click="grabarfactura()"  class="btn btn-primary btn-sm my-2 " title="Grabar pago" >Grabar Pago</button>
                            </div>
                            <?php $sum = 0; ?>
                                <table class="table table-bordered">
                                  <thead>
                                    <tr>
                                      <th scope="col">Num</th>
                                      <th scope="col">Fecha</th>
                                      <th scope="col">Valor</th>
                                      <th scope="col">Dependencia</th>
                                      <th scope="col">Usos</th>
                                      <th scope="col">Borrar</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    @foreach ($lisfact as $key =>$fa )
                                       <?php $sum += $fa['valorfac'];?>
                                    <tr>
                                      <th scope="row">{{ $fa['numfac']}}</th>
                                      <td>{{ $fa['fechafac']}}</td>
                                      <td>{{ number_format($fa['valorfac'])}}</td>
                                      <td>{{ $fa['nomdep']}}</td>
                                      <td>{{ $fa['nomrub']}}</td>
                                      <td><button class="btn bg-transparent color" wire:click="elimina({{ $key }})"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z"/>
                                        <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z"/>
                                      </svg></button> </td>
                                    </tr>
                                   
                                    @endforeach
                                    <tr> <td colspan="2">Total</td>
                                      <td>{{ number_format($sum) }}</td>
                                    </tr>  
                                  </tbody>
                                </table>
                                {{'saldpo:'. $sal.' total: '.$total.' cto. '.$vc }}
                              @endif
                            @endif
                        
                      </div> <!-- Fin card-body  -->
                    </div>
                  </div>
            </div>
        </div>
    </div>
  </div>


@push('scripts')
    <script >
    function ShowSelected()
    {
      
      var combo = document.getElementById("producto");
      var selected = combo.options[combo.selectedIndex].text;
      document.getElementById("numro").value = selected;
      }
    
    </script>    
  @endpush





  
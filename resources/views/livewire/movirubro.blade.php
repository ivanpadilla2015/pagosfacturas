<div>
    <div class="col-6 mx-auto">
        <div class="card">
            <h5 class="card-header">Movimientos Rubros - Adición</h5>
            <div class="card-body form-inline">
                <h5 class="card-title mr-1">Contrato:</h5> 
                <div class="col-sm-10">
                    <input class="form-control form-control-sm" type="text" wire:model="numcontrato" wire:keydown.enter="consulcontra()" autofocus  required >
                    <button wire:click="consulcontra()" class="btn btn-primary ml-1 btn-sm" title="Bucar Contrato">Buscar</button>
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
                        <div>
                            @if($rubs)
                            <table class="table table-sm">
                                <thead>
                                  <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Nombre Rubro</th>
                                    <th scope="col">Valor</th>
                                    <th scope="col">Accion</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    @php $s = 0;  @endphp
                                  @foreach ($rubs as $key => $item)
                                    @php $s += $item['valor'];   @endphp
                                    <tr>
                                        <td>{{ $item['id']}}</td>
                                        <td>{{ $item['nombre_rubro']}}</td>
                                        <td>{{ number_format($item['valor']) }}</td>
                                    </tr>
                                    
                                  @endforeach
                                  <tr>
                                    <th colspan="2" class="text-right" >Total</th>
                                    <th>{{ number_format($s)}} </th>
                                </tr>
                                </tbody>
                              </table>
                            
                            @endif
                        </div>
                        <!-- leer $this->datosrubro -->
                        <div class="col-10 ">
                            <div class="form-group col">
                                <label class="mr-1">Rubros</label>
                                <select  wire:model="adi.id" class="form-control col-sm-10" >
                                    <option value="0">Seleccione</option>
                                    @foreach ($datosrubro as $rubro)
                                      <option value="{{ $rubro->rubroprin->id }}" wire:click="bus_id_rubrocontra({{$rubro->id}})" >{{ $rubro->rubroprin->nombre_rubro.' Saldo : ('.number_format($rubro['saldo']).')' }}</option>
                                    @endforeach
                                  </select>
                                  
                                  @error('rubroprin_id')
                                      <small class="form-text text-danger">{{ $message }}</small>
                                  @enderror
                              </div>
                              <div class="form-group col  mt-1 ">
                                <label class="mr-3">Valor</label>
                                 <input wire:model="adi.valor" class="form-control col-sm-10" placeholder="solo numero " type="text"> 
                                 @error('valorrubro')
                                      <small class="form-text text-danger">{{ $message }}</small>
                                  @enderror
                              </div>
                              <div class="float-right mt-1"><button wire:click="agregar()" class="btn btn-primary btn-sm" >Add</button></div>
                              
                              <div class="form-group col mt-1">
                                <label class="mr-3">Fecha Adicion</label>
                                 <input wire:model="fechaadicion" class="form-control col-sm-10" placeholder="" type="date"> 
                                 @error('fechaadicion')
                                      <small class="form-text text-danger">{{ $message }}</small>
                                  @enderror
                              </div>
                              <div class="form-group col mt-1">
                                <label class="mr-3">Reg. Press Adicion</label>
                                 <input wire:model="registroadicion" class="form-control col-sm-10" placeholder="" type="text"> 
                                 @error('registroadicion')
                                      <small class="form-text text-danger">{{ $message }}</small>
                                  @enderror
                              </div>
                              
                        </div>
                        <div class=" container text-center mt-2"><button wire:click="store()" class="btn btn-success btn-sm" >Grabar Adicion</button></div>
                        
                @endif
            </div>
        </div>
    </div>
</div>
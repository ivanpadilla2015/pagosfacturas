<div>
    <div class="col-6 mx-auto">
        <div class="card">
            <h5 class="card-header">Asignar Rubro Contratos</h5>
            <div class="card-body form-inline">
                <h5 class="card-title mr-1">Contrato:</h5> 
                <div class="col-sm-10">
                    <input class="form-control form-control-sm" type="text" wire:model="numcontrato" wire:keydown.enter="consulcontra()" autofocus  required >
                    <button wire:click="consulcontra()" class="btn btn-primary ml-1" title="Bucar Contrato">Buscar</button>
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
                        <!--- ********************************************************** -->
                        @if($datosrubro)
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">codigo</th>
                                    <th scope="col">Rubro</th>
                                    <th scope="col">accion</th>
                                </tr>
                                </thead>
                                <tbody>
                                  @php $c = 0;     @endphp
                                 @foreach ($datosrubro as $item)
                                    <tr>
                                        <th scope="row">{{ $c += 1}}</th>
                                        <td>{{ $item->rubroprin->codigo_rubro}}</td>
                                        <td>{{ $item->rubroprin->nombre_rubro}}</td>
                                        <td>
                                          <button  wire:click="destroy({{ $item->id }})" onclick="confirm('Confirma Eliminarlo?') || event.stopImmediatePropagation()"  class="btn bg-transparent color" title="Eliminar"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                    </svg></button >
                                        </td>
                                    </tr>
                                 @endforeach
                               
                                </tbody>
                            </table>
                        @endif


                        <div class="form-group col">
                            <label class="mr-1">Rubros</label>
                            <select  wire:model="rubroprin_id" class="form-control col-sm-10" >
                                <option value="0">Seleccione</option>
                                @foreach ($rubpri as $rubro)
                                  <option value="{{ $rubro['id'] }}" wire:click="colocacodigo({{$rubro['id']}})">{{ $rubro['nombre_rubro'] }}</option>
                                @endforeach
                              </select>
                               <div class="mx-auto mt-2">{{$codi_rub}}</div> 
                              @error('rubroprin_id')
                                  <small class="form-text text-danger">{{ $message }}</small>
                              @enderror
                          </div>
                          <div class="form-group col mt-1">
                            <label class="mr-3">Valor</label>
                             <input wire:model="valorrubro" class="form-control col-sm-10" placeholder="valor sin separador de miles" type="text"> 
                             @error('valorrubro')
                                  <small class="form-text text-danger">{{ $message }}</small>
                              @enderror
                          </div>
                          
                          <button wire:click="agragarrubro()" class="btn btn-success btn-sm mt-2" >Agregar</button>
                          <button wire:click="cancel()" class="btn btn-primary btn-sm ml-2 mt-2" >Finalizar</button>
               
                @endif

            </div><!-- card Body -->
        
        </div>
    </div>
</div>

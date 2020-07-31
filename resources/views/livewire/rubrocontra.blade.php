<div>
    <div class="col-6 mx-auto">
        <div class="card">
            <h5 class="card-header">Adicionar Rubro Contratos</h5>
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
                                 @foreach ($datosrubro as $item)
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>{{ $item->rubroprin->codigo_rubro}}</td>
                                        <td>{{ $item->rubroprin->nombre_rubro}}</td>
                                        <td>@mdo</td>
                                    </tr>
                                 @endforeach
                               
                                </tbody>
                            </table>
                        @endif


                        <div class="form-group col">
                            <label >Rubros</label>
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
                          <button wire:click="agragarrubro()" class="btn btn-success btn-sm" >Agregar</button>
               
                @endif

            </div><!-- card Body -->
        
        </div>
    </div>
</div>

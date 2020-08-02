<div>
    <div class="col-6 mx-auto">
        <div class="card">
            <h5 class="card-header">Traslados en Contrato</h5>
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
                        <div style="width:100%" >
                            <table class="table">
                                <thead>
                                  <tr>
                                    <th scope="col">Nomre Rubro</th>
                                    <th scope="col">Valor</th>
                                 </tr>
                                </thead>
                                <tbody>
                                    @foreach ($datosrubro as $item)
                                        <tr>
                                            <th scope="row">{{$item->rubroprin->nombre_rubro}}</th>
                                            <td>{{ number_format($item->saldo)}}</td>
                                      </tr>
                                    @endforeach
                                </tbody>
                            </table>
                              
                                <div class="row">
                                    <div class="col">
                                        <label >DE:</label> 
                                        <select  wire:model="rubro_d" class="form-control col-sm-10 " >
                                            <option value="0">Seleccione</option>
                                            @foreach ($datosrubro as $rubro)
                                              <option value="{{ $rubro->id }}"  >{{ $rubro->rubroprin->nombre_rubro.' Saldo : ('.number_format($rubro['saldo']).')' }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col">
                                        <label >A:</label> 
                                        <select  wire:model="rubro_a" class="form-control col-sm-10 " >
                                            <option value="0">Seleccione</option>
                                            @foreach ($datosrubro as $rubro)
                                              <option value="{{ $rubro->id }}" >{{ $rubro->rubroprin->nombre_rubro.' Saldo : ('.number_format($rubro['saldo']).')' }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="row mt-2 ml-5">
                                    <label  >Valor :</label> 
                                    <input wire:model="valortraslado"type="text" class="form-control mx-2">
                                    <button wire:click="store()" class="btn btn-success btn-sm"> Enviar</button>
                                </div>
                                  
                            
                        </div>
                        
                @endif

            </div><!-- card Body -->
        
        </div>
    </div>
</div>

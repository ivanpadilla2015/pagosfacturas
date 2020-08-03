<div>
    <h5 class="card-header">Colsuta Contrato</h5>
    <h5 class="card-title mt-2 mr-1">Contrato:</h5> 
    <div class="form-inline mt-2">
        <input class="form-control form-control-sm " type="text" wire:model="numcontrato" wire:keydown.enter="consulcontra()" autofocus  required >
        <button wire:click="consulcontra()" class="btn btn-primary btn-sm ml-2" title="Bucar Contrato">Buscar</button>
    </div>
    
    @error('numcontrato')
      <small class=" form-text text-danger">{{ $message }}</small>
    @enderror
    @if ($data) 
            <div class="border border-primary rounded m-2 pl-3 bg-light "> 
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
            <div class="border border-primary rounded m-2 pl-3 bg-light "> 
                <h5 class="card-title mt-2 mr-1">Rubros:</h5> 
                <div class="row">
                    <div class="col">
                      <input type="date" wire:model="fechaini"  class="form-control" placeholder="First name">
                    </div>
                    <div class="col">
                      <input type="date" wire:model="fechafin" class="form-control" placeholder="Last name">
                    </div>
                    <div class="col">
                        <button wire:click="consultafecha()" class="btn btn-success btn-sm">Consultar</button>
                    </div>
                </div>
                    @if($sumxrubro)
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nombre rubro</th>
                                <th scope="col">Total</th>
                                
                            </tr>
                            </thead>
                            <tbody>
                                @foreach ($sumxrubro as  $value)
                                    <tr>
                                        {{$value[0]['numfac']}}
                                    
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    @endif
            </div>
    @endif
            
</div>

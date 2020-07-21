<div>
    <div class="col-6 mx-auto">
        <div class="card">
            <h5 class="card-header">Adicionar Contratos</h5>
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
                         <div class="mx-2 my-2 p-2 bg-light rounded"> 
                            <div class="form-row  ">
                                <div class="col-sm-4 ">
                                    <strong>Valor. Adicon</strong> <input wire:model="valoradicion" class="form-control form-control-sm"  placeholder="valor adicion">
                                    @error('valoradicion') <small class="form-text text-danger">{{ $message }}</small>@enderror
                                </div>
                                
                                <div class="col-sm-4 ml-5">
                                    <strong>Reg. Pres </strong> <input wire:model="registroadicion" type="text" class="form-control form-control-sm" placeholder="Reg Presuspuestal">
                                    @error('registroadicion') <small class="form-text text-danger">{{ $message }}</small>@enderror
                                </div>
                                
                            </div>
                            <div class="form-row  rounded">
                                <div class="col-sm-4 ">
                                    <strong>Fecha</strong> <input wire:model="fechaadicion" type="date" class="form-control form-control-sm" >
                                    @error('fechaadicion') <small class="form-text text-danger">{{ $message }}</small>@enderror
                                </div>
                                <div class="col-sm-5 m-3">
                                    <button wire:click="store()" class="btn btn-primary  " title="Grabar Adición">Enviar</button>
                                    <button wire:click="cancel()" class="btn btn-primary " title="Grabar Adición">Cancel</button>
                                </div>
                            </div>
                        </div>      
               
                @endif

            </div><!-- card Body -->
        
        </div>
    </div>
</div>

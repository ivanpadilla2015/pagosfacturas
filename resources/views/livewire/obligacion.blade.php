<div class="container d-flex flex-row">
    <div class="col-6 ">
        <div class="card">
            <h5 class="card-header">Adicionar Obligación a Contratos</h5>
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

                        @if($updateMode)
                            @include('contrato.obliga_update')
                        @else
                            @include('contrato.obliga_create')
                        @endif
                             
                @endif

            </div><!-- card Body -->
        
        </div>
    </div>
    <div class="col-6 float-sm-right ">
        <div class="card">
            <h5 class="card-header">Listado Obligaciones</h5>
            <div class="card-body form-inline">
               @if ($dato_obli)
               <table class="table table-sm">
                <thead>
                  <tr>
                    <th scope="col">Numeral</th>
                    <th scope="col">Obligacion</th>
                    <th scope="col">Entregable</th>
                    <th scope="col">Handle</th>
                  </tr>
                </thead>
                <tbody>
                   @foreach ($dato_obli as $item)
                   <tr>
                      <td>{{ $item->numeral}}</td>
                      <td>{{ $item->obligacion_deta}}</td>
                      <td>{{ $item->entregable}}</td>
                      <td>
                        <button wire:click="edit({{ $item->id }})" class="btn bg-transparent esnsimasucc" title="Editar"><svg fill="none" width="15" height="15" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" stroke="currentColor" viewBox="0 0 24 24"><path d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg></button>
                        <button wire:click="destroy({{ $item->id }})" onclick="confirm('Confirma Eliminarlo?') || event.stopImmediatePropagation()"  class="btn bg-transparent" title="Eliminar"><svg fill="none" width="15" height="15" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" stroke="currentColor" viewBox="0 0 24 24"><path d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg></button>
                    </td>
                    </tr>
                   @endforeach 
              
                </tbody>
              </table>
               @endif 
                
               

            </div><!-- card Body -->
        
        </div>
    </div>
</div>

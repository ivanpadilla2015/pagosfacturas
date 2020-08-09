<div class="container d-flex flex-row">
    <div class="col-5 ">
        <div class="card">
            <h5 class="card-header">Copiar Riesgos entre Contratos</h5>
            <div class="card-body form-inline">
                <h5 class="card-title mr-1">Contrato:</h5> 
                <div class="col-sm-10">
                    <input class="form-control form-control-sm" type="text" wire:model="numcontrato" wire:keydown.enter="consulcontra()" autofocus  required >
                    <button wire:click="consulcontra()" class="btn btn-primary btn-sm ml-1" title="Bucar Contrato">Buscar</button>
                </div>
                
                @if ($dato_ries)
                   
                    <h5 class="card-title mt-2">Son {{ $totalr }} Para Contrato:</h5> 
                    <div class="col-sm-10 mb-2">
                        <input class="form-control form-control-sm" type="text" wire:model="numcontratop" wire:keydown.enter="consulcontrapara()" autofocus  required >
                        <button wire:click="consulcontrapara()" class="btn btn-primary btn-sm ml-1" title="Bucar Contrato">Buscar</button>
                    </div>
                
                    @if ($updateMode)
                       <div class="mx-auto mt-2">
                            <button wire:click="confirmacion()" class="btn btn-success btn-sm" >Confirmar Copia</button>
                       </div>
                        
                    @endif
                
                @endif
                

            </div><!-- card Body -->
        
        </div>
    </div>
    <div class="col-7 float-sm-right ">
        <div class="card">
            <h5 class="card-header">Listado Riesgos</h5>
            <div class="card-body form-inline">
               @if ($dato_ries)
               <table class="table table-sm">
                <thead>
                  <tr>
                    <th scope="col">Tipo</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">tratamiento</th>
                    <th scope="col">Responsable</th>
                    <th scope="col">Periodicidad</th>
                  </tr>
                </thead>
                <tbody>
                   @foreach ($dato_ries as $item)
                   <tr>
                      <td>{{ $item->tipo}}</td>
                      <td>{{ $item->descripcion}}</td>
                      <td>{{ $item->tratamiento}}</td>
                      <td>{{ $item->responsable}}</td>
                      <td>{{ $item->periodicidad}}</td>
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

<div>
    <div class="col-8 mx-auto">
        <div class="card">
            <h5 class="card-header">Modificar - Adición</h5>
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
                            @if($this->data->adicions)
                            <table class="table table-sm">
                                <thead>
                                  <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">valor Adicion</th>
                                    <th scope="col">Fecha Adicion</th>
                                    <th scope="col">Registro</th>
                                    <th scope="col">Plazo Ejecucion</th>
                                    <th scope="col" colspan="2" class="text-center">Acción</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    @php $s = 0;  @endphp
                                  @foreach ($this->data->adicions as $key => $item)
                                   
                                    <tr>
                                        <td>{{ $item['id']}}</td>
                                        <td>{{ number_format($item['valoradicion']) }}</td>
                                        <td>{{ $item['fechaadicion']}}</td>
                                        <td>{{ $item['registroadicion']}}</td>
                                        <td>{{ $item['newplazoejecucion']}}</td>
                                        <td > 
                                        <button data-toggle="modal" data-target="#updateModal"  wire:click="editdeta({{ $item->id }})" class="btn bg-transparent" title="editar" style="color: #1d68a7;" ><svg width="2em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M11.293 1.293a1 1 0 0 1 1.414 0l2 2a1 1 0 0 1 0 1.414l-9 9a1 1 0 0 1-.39.242l-3 1a1 1 0 0 1-1.266-1.265l1-3a1 1 0 0 1 .242-.391l9-9zM12 2l2 2-9 9-3 1 1-3 9-9z"/>
                                                <path fill-rule="evenodd" d="M12.146 6.354l-2.5-2.5.708-.708 2.5 2.5-.707.708zM3 10v.5a.5.5 0 0 0 .5.5H4v.5a.5.5 0 0 0 .5.5H5v.5a.5.5 0 0 0 .5.5H6v-1.5a.5.5 0 0 0-.5-.5H5v-.5a.5.5 0 0 0-.5-.5H3z"/>
                                                </svg></button>
                                        </td>
                                        <td>
                                         <button  wire:click="destroy({{ $item->id }})" onclick="confirm('Confirma Eliminarla?') || event.stopImmediatePropagation()" class="btn bg-transparent" style="color: #FF0000;" title="eliminar"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                </svg></button>
                                        </td>
                                       
                                    </tr>
                                    
                                  @endforeach
                                 
                                </tbody>
                              </table>
                            
                            @endif
                        </div>
                        <!-- leer $this->datosrubro -->
                      
                    @endif
            </div>          
        </div>
    </div>
      <!-- Modal -->

      <div wire:ignore.self class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title" id="exampleModalLabel">Editar Adición</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                         <span aria-hidden="true">×</span>
                      </button>
                 </div>
                 <div class="modal-body">
                     <form>
                         <div class="form-group">
                             <label >Fecha Adición</label>
                             <input type="date" class="form-control" wire:model="fechaadicion"  placeholder="Fecha Adicion">
                             @error('fechaadicion') <span class="text-danger">{{ $message }}</span>@enderror
                         </div>
                         <div class="form-group">  
                             <label >Valor Adición</label>
                             <input type="text" class="form-control" wire:model="valoradicion"  placeholder="Valor Adcion">
                             @error('valoradicion') <span class="text-danger">{{ $message }}</span>@enderror
                         </div>
                         <div class="form-group">
                            <label >Reg. Adición</label>
                            <input type="text" class="form-control" wire:model="registroadicion"  placeholder="Registo Adicion">
                            @error('registroadicion') <span class="text-danger">{{ $message }}</span>@enderror
                         </div>
                         <div class="form-group">
                            <label >New Plazo Contrato</label>
                            <input type="date" class="form-control" wire:model="newplazoejecucion"  placeholder="Nuevo Plazo Ejecución">
                            @error('newplazoejecucion') <span class="text-danger">{{ $message }}</span>@enderror
                         </div>
                     </form>
                 </div>
                 <div class="modal-footer">
                     <button type="button"  class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                     <button type="button" wire:click.prevent="updatedeta()" class="btn btn-primary" data-dismiss="modal">Grabar Cambios</button>
                 </div>
             </div>

         </div>

     </div>
<!-- Modal edi Pago-->
</div>
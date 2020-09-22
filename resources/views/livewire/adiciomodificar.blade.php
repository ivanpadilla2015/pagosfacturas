<div>
    <div class="col-6 mx-auto">
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
                                    <th scope="col">Acción</th>
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
                                        <td> <button data-toggle="modal" data-target="#updateModal"  wire:click="editdeta({{ $item->id }})" class="btn btn-danger btn-sm">Editar</button> </td>
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
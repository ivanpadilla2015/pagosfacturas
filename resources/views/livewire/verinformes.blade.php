<div>
    <div class="col-8 mx-auto">
        <div class="card">
            <h5 class="card-header">Informes de Contrato</h5>
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
                            @if($this->data->inforsuminis)
                            <table class="table table-sm">
                                <thead>
                                  <tr>
                                    <th scope="col">Reporte</th>
                                    <th scope="col">valor Informe</th>
                                    <th scope="col">Fecha Informe</th>
                                    <th scope="col">Total Contrato</th>
                                    <th scope="col">Mes Ejecutado</th>
                                    <th scope="col">Num Informe</th>
                                    <th scope="col" colspan="2" class="text-center">Acción</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    @php $s = 0;  @endphp
                                  @foreach ($this->data->inforsuminis as $key => $item)
                                   
                                    <tr>
                                        <td class="text-center">{{ $item['id']}}</td>
                                        <td>{{ number_format($item['total_info']) }}</td>
                                        <td class="text-danger">{{ $item['fechainfo']}}</td>
                                        <td>{{ number_format($item['gran_total'])}}</td>
                                        <td class="text-danger text-center">{{ $item['mes_ejecucion']}}</td>
                                        <td class="text-center">{{ $item['sum_conse']}}</td>
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
                     <h5 class="modal-title" id="exampleModalLabel">Editar Informe</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                         <span aria-hidden="true">×</span>
                      </button>
                 </div>
                 <div class="modal-body">
                     <form>
                         <div class="form-group">
                             <label >Fecha Informe</label>
                             <input type="date" class="form-control" wire:model="fechainfo"  placeholder="Fecha Adicion">
                             @error('fechainfo') <span class="text-danger">{{ $message }}</span>@enderror
                         </div>
                         <div class="form-group">  
                             <label >Corresponde :</label>
                             <input type="text" class="form-control" wire:model="corresponde_periodo"  placeholder="Valor Adcion">
                             @error('corresponde_periodo') <span class="text-danger">{{ $message }}</span>@enderror
                         </div>
                         <div class="form-group">
                            <label>Mes Ejecucion</label>
                            <select wire:model="mes_ejecucion" class="form-control">
                              <option value="0">Seleccione</option>
                              <option value="1">Enero</option>
                              <option value="2">Febrero</option>
                              <option value="3">Marzo</option>
                              <option value="4">Abril</option>
                              <option value="5">Mayo</option>
                              <option value="6">Junio</option>
                              <option value="7">Julio</option>
                              <option value="8">Agosto</option>
                              <option value="9">Septiembre</option>
                              <option value="10">Octubre</option>
                              <option value="11">Noviembre</option>
                              <option value="12">Diciembre</option>
                           </select>
                            @error('mes_ejecucion') <span class="text-danger">{{$message}}</span>@enderror
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
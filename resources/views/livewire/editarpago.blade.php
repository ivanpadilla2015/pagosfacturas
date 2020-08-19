<div>
        <div class="form-group mb-2">
            <label class="mr-1">Pago No</label>
            <select  class="form-control" name="pago_id">
                <option value="0">Seleccione</option>
                @foreach ($contra as $con)
                <option value="{{ $con['id'] }}" wire:click="consulpago({{$con['id']}})">{{"Pago No: ".$con['id']." Cto : ".$con->contrato->numcontrato." - Vlr : ".number_format($con->total)}}</option>
                @endforeach
            </select>
          <p class="text-danger">{{ $errors->first('pago_id') }}</p>
       </div>
      
      @if ($data)
           <div class="border border-primary rounded m-1 pl-3 bg-light ">
                <div class="form-row">
                        <div class="col">
                            <strong>Pago No : </strong> <small>{{ $data->id}}</small><br>
                            <strong>C. Pago : </strong> <small class="text-danger">{{ $data->consecu_informe}}</small>
                        </div>
                        <div class="col">
                            <strong>Valor a Pagar : </strong> <small>{{ number_format($data->total,2)}}</small>
                        </div>
                        <div class="col">
                        <strong>F. Pago : </strong> <small class="text-danger">{{ $data->fecha_pago}}</small><br>
                        <strong>C. Informe : </strong> <small class="text-danger">{{ $data->sum_conse}}</small>
                        </div>
                </div>
                <div class="form-row ">
                    <div class="col">
                        <strong>Contrato No : </strong> <small>{{ $data->contrato->numcontrato}}</small>
                    </div>
                    <div class="col">
                        <strong>Valor Contrato : </strong> <small>{{ number_format($data->contrato->valorcontrato,2)}}</small>
                    </div>
                    <div class="col">
                        <strong>Saldo Cto : </strong> <small>{{ number_format($data->contrato->saldo,2)}}</small>
                    </div>
                </div>
                <button wire:click="editencabe" class="mb-2 btn btn-danger btn-sm">Editar</button>
           </div>
           <div>
            <table class="table table-sm mt-2">
                <thead class="thead-light" >
                  <tr>
                    <th scope="col">Factura</th>
                    <th scope="col">Fecha</th>
                    <th scope="col">Dependencia</th>
                    <th scope="col">Uso</th>
                    <th scope="col">Valor</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                  <?php $sum = 0; ?>
                  @foreach ($data->facturadetas as $item)
                      <?php $sum += $item->valorfac; ?>
                    <tr>
                      <td>{{ $item->numfac }}</th>
                      <td class="text-danger">{{ $item->fechafac }}</td>
                      <td class="text-danger">{{ $item->dependencia->nombredepen }}</td>
                      <td class="col-sm-5 text-danger">{{ $item->uso_rubro->nombre_uso}}</td>
                      <td class="text-right">{{ number_format($item->valorfac,2) }}</td>
                      <td> <button data-toggle="modal" data-target="#updateModal"  wire:click="editdeta({{ $item->id }})" class="btn btn-danger btn-sm">Editar</button> </td>
                    </tr>
                  @endforeach
                      <tr>
                        <td colspan="3"></th>
                        <td class="text-right"><strong>Total:</strong></td>
                        <td>{{ number_format($sum,2) }}</td>
                      </tr>
                 </tbody>
              </table>
           </div>
        @endif
        <!-- Modal -->

                        <div wire:ignore.self class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

                            <div class="modal-dialog" role="document">

                            <div class="modal-content">

                                    <div class="modal-header">

                                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>

                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                                            <span aria-hidden="true">×</span>

                                        </button>

                                    </div>

                                    <div class="modal-body">

                                        <form>

                                            <div class="form-group">

                                                <input type="hidden" wire:model="user_id">

                                                <label for="exampleFormControlInput1">Name</label>

                                                <input type="text" class="form-control" wire:model="name" id="exampleFormControlInput1" placeholder="Enter Name">

                                                @error('name') <span class="text-danger">{{ $message }}</span>@enderror

                                            </div>

                                            <div class="form-group">

                                                <label for="exampleFormControlInput2">Email address</label>

                                                <input type="email" class="form-control" wire:model="email" id="exampleFormControlInput2" placeholder="Enter Email">

                                                @error('email') <span class="text-danger">{{ $message }}</span>@enderror

                                            </div>

                                        </form>

                                    </div>

                                    <div class="modal-footer">

                                        <button type="button" wire:click.prevent="cancel()" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                        <button type="button" wire:click.prevent="update()" class="btn btn-primary" data-dismiss="modal">Save changes</button>

                                    </div>

                            </div>

                            </div>

                        </div>
</div>

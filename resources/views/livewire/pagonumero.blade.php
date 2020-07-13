<div>
    <div class="row">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-8">
                    <div class="card">
                      <div class="card-body">

                        <div class="form-group col">
                            <label >Pago No:</label>
                            <select wire:model="pago_id"  class="form-control" >
                                <option value="0" wire:click="consulcon({{0}})">Seleccione</option>
                                @foreach ($contra as $con)
                                  <option value="{{ $con['id'] }}" wire:click="consulcon({{$con['id']}})">{{"Pago No: ".$con['id']." Cto : ".$con->contrato->numcontrato." Prov.: ".$con->contrato->proveedor->nombre."  Valor: ".number_format($con->total) }}</option>
                                @endforeach
                              </select>
                        </div>

                      </div><!-- card-body -->
                    </div><!-- card -->
                </div><!-- col-8 -->
            </div><!--row d-flex justify-content-center -->
        </div><!--container -->
    </div><!--row-->
</div>

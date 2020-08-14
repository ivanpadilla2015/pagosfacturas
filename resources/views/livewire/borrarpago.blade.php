<div>
    <div class=" row">
        <label  class="">No ID Pago :</label>
        <div class="ml-1">
          <input wire:model="npago" wire:keydown.enter="buscapago()" class="form-control form-control-sm " autofocus  type="text">
        </div>
        <div class="ml-1">
            <button wire:click="buscapago()" class="btn btn-success btn-sm">Buscar</button>
        </div>
    </div>
    @if ($pag)
    <div class="border border-primary rounded m-1 pl-3 bg-light "> 
        <div class="form-row ">
            <div class="col">
                <strong>Contrato No : </strong> <small>{{ $pag->contrato->numcontrato}}</small>
            </div>
            <div class="col">
                <strong>Valor Contrato : </strong> <small>{{ number_format($pag->contrato->gran_total,2)}}</small>
            </div>
            <div class="col">
                <strong>Saldo Cto : </strong> <small>{{ number_format($pag->contrato->saldo,2)}}</small>
            </div>
        </div>
        <div class="form-row  rounded">
            <div class="col">
               <strong>Ejecutado : </strong> <small>{{ $pag->contrato->ejecutado.'%'}}</small>
            </div>
            <div class="col">
               <strong>Prov: : </strong> <small>{{($pag->contrato->proveedor->nombre)}}</small>
            </div>
        </div>
    </div>
    <div class="border border-primary rounded m-1 pl-3 bg-light "> 
        <div class="form-row ">
            <div class="col">
                <strong>Pago No : </strong> <small>{{ $pag->consecu_informe }}</small>
            </div>
            <div class="col">
                <strong>Valor Pago : </strong> <small class="text-danger">{{ number_format($pag->total)}}</small>
            </div>
            <div class="col">
                <strong>Saldo Ant. : </strong> <small>{{ number_format($pag->saldo_viene)}}</small>
            </div>
        </div>
    </div>
    <div class="text-center mt-1">
        <button wire:click="borrarpago()" onclick="confirm('Confirma Eliminarlo?') || event.stopImmediatePropagation()" class="btn btn-success btn-sm">Borrar</button>
    </div>

    @endif
</div>

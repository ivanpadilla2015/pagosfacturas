<div>
    <div class="row">
        <div class="col">
            <label >Contrato</label>
            <select wire:model="contrato_id"  class="form-control" >
                <option value="0">Seleccione</option>
                @foreach ($contra as $con)
                  <option value="{{ $con['id'] }}" >{{ $con['numcontrato']." ".$con->proveedor->nombre."  Saldo: ".number_format($con->saldo) }}</option>
                @endforeach
            </select>
            @error('contrato_id') <span class="text-danger">{{$message}}</span>@enderror
          </div>
        <div class="col">
          <label >Tramite de Pago No</label>
          <input type="text" wire:model="consecu_informe" class="form-control" placeholder="No Pago">
          @error('consecu_informe') <span class="text-danger">{{$message}}</span>@enderror
        </div>
        
        <div class="col">
            <label >Vlor Pago</label>
            <input type="text" wire:model="total" class="form-control" placeholder="Valor Pago">
            @error('total') <span class="text-danger">{{$message}}</span>@enderror
        </div>
    </div>

    <div class="row">
        <div class="col">
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
        <div class="col">
          <label >Corresponde</label>
          <input type="text" wire:model="pago_corresponde_mes" class="form-control" placeholder="Corresponde..">
          @error('pago_corresponde_mes') <span class="text-danger">{{$message}}</span>@enderror
        </div>
        
        <div class="col">
            <label >Saldo Viene</label>
            <input type="text" wire:model="saldo_viene" class="form-control" placeholder="Saldo del momento Pago">
            @error('saldo_viene') <span class="text-danger">{{$message}}</span>@enderror
        </div>
    </div>

    <div class="row">
        <div class="col">
            <label>% Consumido</label>
            <input type="text" wire:model="porcentaje_cumplimiento" class="form-control" placeholder="Porcentaje Cumplimiento">
            @error('porcentaje_cumplimiento') <span class="text-danger">{{$message}}</span>@enderror
        </div>
        <div class="col">
          <label >Fecha Pago</label>
          <input type="date" wire:model="fecha_pago" class="form-control" placeholder="Fecha Pago">
          @error('fecha_pago') <span class="text-danger">{{$message}}</span>@enderror
        </div>
        
        <div class="col">
            <button wire:click="grabarpago()" onclick="confirm('Confirma Grabar Pago?') || event.stopImmediatePropagation()" class="btn btn-primary btn-sm mt-4" >Grabar</button>
        </div>
    </div>
</div>
       
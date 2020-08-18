<div class="form-group col">
    <label >Contrato</label>
    <select wire:model="contrato_id"  class="form-control" >
        <option value="0" wire:click="consulcon({{0}})">Seleccione</option>
        @foreach ($contra as $con)
          <option value="{{ $con['id'] }}" wire:click="consulcon({{$con['id']}})">{{ $con['numcontrato']." ".$con->proveedor->nombre."  Saldo: ".number_format($con->saldo) }}</option>
        @endforeach
      </select>
</div>
@if ($data) 
    <strong class="mr-2">Contrato : </strong>{{$data->numcontrato}} <strong class="mr-2 ml-2">Valor Cto : </strong>{{number_format($data->valorcontrato) }} <strong class="mr-2 ml-2">Adicion : </strong><span>{{number_format($data->valoradicion)}}</span> <strong class="mr-2 ml-2">Saldo : </strong><span>{{number_format($data->saldo)}}</span><br />
    <strong class="mr-2">Proveedor : </strong><span>{{$data->proveedor->nombre}}</span> <strong class="ml-2 mr-2">Supervidor : </strong>{{$data->supervisor}} <strong class="mr-2 ml-2">Ejecutado : </strong><span>{{($data->ejecutado).'%'}}</span><br />
      <div class="form-row">
        <div class="col-2 text-center">
          <strong>Pago No</strong><br>
          <small>{{++$data->pagos}}</small>
        </div>
        <div class="col-4">
            <strong>Reg. Pres</strong><br>
            <small>{{ $data->registro_pres_inic }}</small>
        </div>
        <div class="col">
          <strong>Inter Admin</strong><br>
          <small>{{ $data->concargo->detalle_inter }}</small> 
        </div>
        <div class="col-2 text-center ">
            <strong>Informe No</strong><br>
            <small class="bg-warning px-4">{{++$data->sum_conse}}</small>
          </div>
      </div>
      @php $c=0 @endphp
      @foreach ($data->adicions as $item)
        @php $c += 1 @endphp
        <strong>{{'Adicion '.$c.' :'}}</strong><span class="ml-1">{{ number_format($item->valoradicion) }}</span> <strong class="ml-2">{{'Fecha :'}}</strong><span class="ml-1">{{ $item->fechaadicion }}</span> <strong class="ml-2">{{'Registro :'}}</strong><span class="ml-1">{{ $item->registroadicion }}</span>  <br>
      @endforeach
    <strong >Objeto: </strong> 
    <div class="alert alert-primary" role="alert">
            {{ $data->objetocontrato }}
    </div>
    <div class="form-row mb-2 pb-2 bg-info">
        
        <div class="col text-center">
          <label>Nuevo % Cumplimiento</label><br>
           {{ $porcentaje_cumplimiento.'%' }} 
        </div>
        <form wire:submit.prevent="agregarfact">
            <div class="form-row">
              <div class="col">
                <input wire:model="fact.numfac" type="text" class="form-control" placeholder="Num Factura">
               @error('numfac') <span class="text-danger">{{$message}}</span>@enderror
              </div>
              <div class="col">
                <input wire:model="fact.fechafac" type="date" class="form-control" placeholder="Fecha Fac">
                @error('fact.fechafac') <span class="text-danger">{{$message}}</span>@enderror
              </div>
              <div class="col">
                <input wire:model="fact.valorfac" type="text" class="form-control" placeholder="Valor Fac">
                @error('fact.valorfac') <span class="text-danger">{{$message}}</span>@enderror
              </div>
              <div class="col">
                <select wire:model="fact.dependencia_id"  class="form-control" >
                  <option value="0">Seleccione</option>
                  @foreach ($depen as $depe)
                    <option value="{{ $depe['id'] }}"  >{{ $depe['nombredepen'] }}</option>
                  @endforeach
                </select>
                @error('fact.dependencia_id') <span class="text-danger">{{$message}}</span>@enderror
              </div>
              <div class="col">
                <select wire:model="fact.rubro_id"  class="form-control" id="producto"   >
                  <option value="0">Seleccione</option>
                  @foreach ($lisusos as $uso)
                    <option value="{{ $uso['id'] }}"  >{{ $uso['nombre_uso'] }}</option>
                  @endforeach 
                </select>
            </div>
      
            </div><!--  fin form-row -->
          
            <button type="submit" class="btn btn-primary btn-sm mt-2 float-right" >Add Fac</button>
          </form>
    </div>
    @if ($lisfact)
    
        <div class="float-center ">
          <button wire:click="grabarfactura()" onclick="confirm('Confirma Terminar pago?') || event.stopImmediatePropagation()"   class="btn btn-success btn-sm my-2 " title="Grabar pago" >Grabar Pago</button>
          @include('pagos.sumarfacturas')
        </div>
        <?php $sum = 0; ?>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th scope="col">Num</th>
              <th scope="col">Fecha</th>
              <th scope="col">Valor</th>
              <th scope="col">Dependencia</th>
              <th scope="col">Usos</th>
              <th scope="col">Borrar</th>
            </tr>
          </thead>
          <tbody>
            @foreach ($lisfact as $key =>$fa )
               <?php $sum += $fa['valorfac'];?>
            <tr>
              <th scope="row">{{ $fa['numfac']}}</th>
              <td>{{ $fa['fechafac']}}</td>
              <td>{{ number_format($fa['valorfac'])}}</td>
              <td>{{ $fa['nomdep']}}</td>
              <td>{{ $fa['nomrub']}}</td>
              <td><button class="btn bg-transparent color" wire:click="elimina({{ $key }})"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z"/>
                <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z"/>
              </svg></button> </td>
            </tr>
           
            @endforeach
            <tr> <td colspan="2">Total</td>
              <td>{{ number_format($sum) }}</td>
            </tr>  
          </tbody>
        </table>
        
      @endif
      
@endif




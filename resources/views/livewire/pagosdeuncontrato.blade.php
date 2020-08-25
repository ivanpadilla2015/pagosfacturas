<div>
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
               <button class="btn btn-info btn-sm">Imprimir</button>
           </div>
           <div class="col-8 mx-auto">
                @foreach ($pagos as $item)
                 <div class="pl-1 bg-gradient-info text-white">Pago : {{$item->consecu_informe}} <b class="ml-3 mr-1"> Valor :</b> {{number_format($item->total)}} <b class="ml-3 mr-1">Reporte :</b>  {{$item->id}}</div>
                
                <table class="table table-sm ">
                    <thead>
                        <tr>
                            <th class="col-15-sm">Factura</th>
                            <th class="col-20-sm text-center">Valor</th>
                            <th class="col">Dependencia</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($item->facturadetas as $fact)
                            <tr>
                                <td>{{$fact->numfac}}</td>
                                <td class="text-right">{{number_format($fact->valorfac)}}</td>
                                <td>{{ $fact->dependencia->nombredepen }}</td>
                            </tr>    
                        @endforeach
                    </tbody>
                </table>    
               @endforeach
     
           </div>
            
    @endif
                        
</div>
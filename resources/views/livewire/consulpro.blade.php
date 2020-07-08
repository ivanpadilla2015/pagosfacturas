<div>
    <div class="row">
        <div class="col-sm-6">
          <div class="card">
            <div class="card-body">
                <div class="row ">
                   
                    <div class="form-group col">
                      <label >Proveedor</label>
                      <select wire:model="proveedor_id"  class="form-control" >
                          <option value="0">Seleccione</option>
                          @foreach ($proved as $prov)
                            <option value="{{ $prov['id'] }}" wire:click="consul({{$prov['id']}})">{{ $prov['nombre'] }}</option>
                          @endforeach
                        </select>
                        @error('proveedor_id')
                            <small class="form-text text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <table class="table table-sm">
                        <thead>
                            <tr>
                                <th style="width:15%;">Numero</th>
                                <th style="width:15%;">Valor</th>
                                <th style="width:15%;">saldo</th>
                                <th style="width:10%;">Facturas</th>
                            </tr>
                        </thead>
                        <tbody>
                           @if($data) 
                              @forelse ($data->contratos as $item) 
                                    <tr>
                                        <td >{{$item->numcontrato}}</td>
                                        <td >{{number_format($item->valorcontrato)}}</td>
                                        <td >{{number_format($item->saldo)}}</td>
                                        <td ><button wire:click="buscarfac({{ $item->id }})"  class="btn btn-info" title="Ver Facturas">
                                          Ver
                                      </button></td>
                                    </tr>
                                @empty
                                    <tr >
                                        <td colspan="5" class="py-3 ">No hay información</td>
                                    </tr>
                                @endforelse
                            @endif
                          </tbody>
                        
                    </table>
                </div> <!-- fin row -->
            </div>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="card">
            <div class="card-body">
             <div class="row">
                    <h5 class="card-title">Relacion de Facturas</h5>
                    @if($facts)
              
                          <table class="table table-sm">
                            <thead>
                                <tr>
                                    <th style="width:15%;">Numero</th>
                                    <th style="width:15%;">Valor</th>
                                    <th style="width:15%;">saldo</th>
                                    <th style="width:10%;">Facturas</th>
                                </tr>
                            </thead>
                            <tbody>
                              @if($data) 
                                  @forelse ($facts->facturas as $item) 
                                        <tr>
                                           
                                        </tr>
                                    @empty
                                        <tr >
                                            <td colspan="5" class="py-3 ">No hay información</td>
                                        </tr>
                                    @endforelse
                                @endif
                              </tbody>
                            
                            </table>
                      @endif      
                  </div> <!-- fin row -->
                
              
            </div>
          </div>
        </div>
      </div>
</div>

        <div class="card">
            <div class="card-header">
              Nuevo Contrato
            </div>
            <div class="card-body">
                <div class="row ">
                    <div class="form-group col">
                      <label >Contrato No</label> 
                      <input wire:model="numcontrato" type="text" class="form-control" placeholder="Num contrato">
                      @error('numcontrato')
                        <small class="form-text text-danger">{{ $message }}</small>
                     @enderror
                    </div>
                    <div class="form-group col">
                      <label >Proveedor</label>
                      <select  wire:model="proveedor_id" class="form-control" >
                          <option value="0">Seleccione</option>
                          @foreach ($proved as $prov)
                            <option value="{{ $prov['id'] }}">{{ $prov['nombre'] }}</option>
                          @endforeach
                        </select>
                        @error('proveedor_id')
                            <small class="form-text text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="form-group col">
                        <label >Dependencia</label>
                        <select wire:model="dependencia_id" class="form-control">
                            <option value="0">Seleccione</option>
                            @foreach ($depen as $depe)
                              <option value="{{ $depe['id'] }}">{{ $depe['nombredepen'] }}</option>
                            @endforeach
                          </select>
                          @error('dependencia_id')
                              <small class="form-text text-danger">{{ $message }}</small>
                          @enderror
                    </div>
                </div>
                  <div class="row ">
                    <div class="form-group col">
                        <label >Tipo Contrato</label>
                        <select wire:model="tipocontrato_id" class="form-control">
                            <option value="0">Seleccione</option>
                            @foreach ($tipoc as $tipo)
                              <option value="{{ $tipo['id'] }}">{{ $tipo['nombretipo'] }}</option>
                            @endforeach
                          </select>
                          @error('tipocontrato_id')
                              <small class="form-text text-danger">{{ $message }}</small>
                          @enderror
                    </div>
                    <div class="form-group col">
                      <label >Fecha Contrato</label>  
                      <input wire:model="fechacontrato" type="date" class="form-control" placeholder="Fecha Contrato">
                      @error('fechacontrato')
                        <small class="form-text text-danger">{{ $message }}</small>
                      @enderror
                    </div>
                    <div class="form-group col">
                      <label >Valor Contrato</label>
                      <input wire:model="valorcontrato" type="text" class="form-control" placeholder="Valor ">
                      @error('valorcontrato')
                        <small class="form-text text-danger">{{ $message }}</small>
                      @enderror
                    </div>
                  </div>

                  <div class="row ">
                    <div class="form-group col">
                      <label >Registro Presupuestal</label>
                      <input wire:model="registro_pres_inic" type="text" class="form-control" placeholder="Registro pres">
                     
                    </div>
                    <div class="form-group col">
                      <label >Plazo Ejecucion</label>  
                      <input wire:model="plazoejecucion" type="date" class="form-control" placeholder="Plazo Ejecucion">
                      @error('plazoejecucion')
                        <small class="form-text text-danger">{{ $message }}</small>
                      @enderror
                    </div>
                    <div class="form-group col">
                      <label >Contrato Inter</label>  
                         <select wire:model="concargo_id" class="form-control">
                            <option value="0">Seleccione</option>
                            @foreach ($concar as $car)
                              <option value="{{ $car['id'] }}">{{ $car['detalle_inter'] }}</option>
                            @endforeach
                          </select>
                          @error('concargo_id')
                              <small class="form-text text-danger">{{ $message }}</small>
                          @enderror
                    </div>
                  </div>

                  <div class="row">
                    <div class="form-group col">
                        <label >Objeto Contrato</label>  
                        <textarea wire:model="objetocontrato" class="form-control" placeholder="Objeto"  rows="3">{{ old('objetocontrato') }}</textarea>
                        @error('objetocontrato')
                        <small class="form-text text-danger">{{ $message }}</small>
                        @enderror
                      </div>
                  </div>
                  
                  <button wire:click="store()" type="submit" class="btn btn-primary">Crear</button>
                  <button wire:click.prevent="cancel()" class="btn btn-danger">Cancel</button>
            </div>
          </div>
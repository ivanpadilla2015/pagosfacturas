
        

          <div class="card">
            <div class="card-header">
              Nuevo Proveedor
            </div>
            <div class="card-body">
                <div class="row ">
                    <div class="form-group col">
                      <label >Nombre Proveedor</label> 
                      <input wire:model="nombre" type="text" class="form-control" placeholder="Nombre Proveedor">
                      @error('nombre')
                        <small class="form-text text-danger">{{ $message }}</small>
                     @enderror
                    </div>
                    <div class="form-group col">
                      <label >Nit o Id</label>
                      <input wire:model="nitproveedor" type="text" class="form-control" placeholder="Nit">
                      @error('nitproveedor')
                        <small class="form-text text-danger">{{ $message }}</small>
                      @enderror
                    </div>
                    <div class="form-group col">
                      <label >Correo Electronico</label>
                      <input wire:model="email" type="mail" class="form-control" placeholder="email">
                      @error('email')
                        <small class="form-text text-danger">{{ $message }}</small>
                      @enderror
                    </div>
                  </div>

                  <div class="row ">
                    <div class="form-group col">
                      <label >Rep. Legal</label>
                      <input wire:model="reprelegal" type="text" class="form-control" placeholder="Representante Legal">
                      
                    </div>
                    <div class="form-group col">
                      <label >Telefono</label>  
                      <input wire:model="telefono" type="text" class="form-control" placeholder="telefonot">
                      @error('telefono')
                        <small class="form-text text-danger">{{ $message }}</small>
                      @enderror
                    </div>
                    <div class="form-group col">
                      <label >Dirección</label>
                      <input wire:model="direccion" type="text" class="form-control" placeholder="direccion">
                      @error('direccion')
                        <small class="form-text text-danger">{{ $message }}</small>
                      @enderror
                    </div>
                  </div>

                  <div class="row ">
                    <div class="form-group col">
                      <label >Contacto</label>
                      <input wire:model="contacto" type="text" class="form-control" placeholder="Contacto">
                    </div>
                    <div class="form-group col">
                      <label >Cuenta</label>  
                      <input wire:model="cuenta" type="text" class="form-control" placeholder="Cuenta">
                    </div>
                    <div class="form-group col">
                        <label >Tipo Persona</label>
                            <select wire:model="tipoper" class="form-control" id="exampleFormControlSelect1">
                                <option value="0">Seleccionar</option>
                                <option value="1">Juridica</option>
                                <option value="2">Natural</option>
                           </select>
                           @error('tipoper')
                            <small class="form-text text-danger">{{ $message }}</small>
                           @enderror
                    </div>
                  </div>

                  <div class="row">
                    <div class="form-group form-check ml-3">
                        <input wire:model="regimensimpli"  type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Regimen Simplificado</label>
                      </div>
                  </div>

                  <button wire:click="store()" type="submit" class="btn btn-primary">Crear</button>
                  <button wire:click.prevent="cancel()" class="btn btn-danger">Cancel</button>
            </div>
          </div>
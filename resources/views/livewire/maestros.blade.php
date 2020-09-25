<div>
    <div class="col-6 mx-auto">
        <div class="card">
            <h5 class="card-header">Datos Mestros</h5>
            <div class="card-body">
                
               
                    <div class="form-group">
                      <label >Nombre Director :</label>
                    <input wire:model="director"  class="form-control" >
                      
                    </div>
                    <div class="form-group">
                      <label >Cargo :</label>
                      <input wire:model="cargo_director"  class="form-control" >
                    </div>
                    <div class="form-group">
                      <label >Nombre Presupuesto :</label>
                    <input wire:model="presupuesto"  class="form-control" >
                      
                    </div>
                    <div class="form-group">
                      <label >Cargo Presu :</label>
                      <input wire:model="cargo_presupuesto"  class="form-control" >
                    </div>
                    <div class="form-group">
                      <label >Ciudad :</label>
                      <input wire:model="ciudad"  class="form-control" type="text" >
                    </div>
                   
                    <button wire:click="buscar" class="btn btn-primary btn-sm">Buscar Datos</button>
                    
                    <button wire:click="store" class="btn btn-success btn-sm">Grabar Cambios</button>
                        

            </div><!-- card Body -->
        
        </div>
    </div>
</div>

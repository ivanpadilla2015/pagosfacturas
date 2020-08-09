<div class="form-row">
    <div class="col">
      <label class="float-left">Tipo Riesgo</label> 
      <input wire:model="tipo" type="text" class="form-control form-control-sm" placeholder="tipo">
    </div>
    <div class="col">
        <label class="float-left">Tratamiento</label> 
        <input wire:model="tratamiento" type="text" class="form-control form-control-sm" placeholder="tratamiento">
        @error('tratamiento') <small class="form-text text-danger">{{ $message }}</small>@enderror
    </div>
   
</div>
<div class="form-row">
    <div class="col">
        <label class="float-left">Descripción</label> 
        <textarea wire:model="descripcion" cols="43" rows="3" class="form-control form-control-sm" placeholder="descripcion"></textarea>
        @error('descripcion') <small class="form-text text-danger">{{ $message }}</small>@enderror
    </div>
</div>
<div class="form-row">
    <div class="col">
      <label class="float-left">Responsable</label> 
      <input wire:model="responsable" type="text" class="form-control form-control-sm" placeholder="responsable">
      @error('responsable') <small class="form-text text-danger">{{ $message }}</small>@enderror
    </div>
    <div class="col">
        <label class="float-left">Periosidad</label> 
        <input wire:model="periodicidad" type="text" class="form-control form-control-sm" placeholder="periosidad">
    </div>
</div>
<div class="row  mx-auto ">
    
        <button wire:click="update()" class="btn btn-success btn-sm mt-2 ">Actualizar</button>
    
</div>


<div class="mx-auto col-4 mb-2 p-4 bg-secondary rounded text-white ">
    <input type="hidden" wire:model="selected_id">
    <div class="form-group">
        <label>Nombre Rubro</label>
        <input wire:model="nombrerubro" type="text" placeholder="Nombre Rubro..." class="form-control"  >
        @error('nombrerubro')
          <small class="form-text text-white">{{ $message }}</small>
        @enderror
    </div>
    <div class="form-group">
        <label>Codigo</label>
        <input wire:model="codigo" type="text" placeholder="codigo..." class="form-control"  >
        @error('codigo')
          <small class="form-text text-white">{{ $message }}</small>
        @enderror
    </div>
    <button wire:click="update()" type="submit" class="btn btn-primary">Actualizar</button>
    
 </div>
<div class="mx-auto col-4 mb-2 p-4 bg-secondary rounded text-white ">
    <input type="hidden" wire:model="selected_id">
    <div class="form-group">
        <label>Nobre Dependencia</label>
        <input wire:model="nombredepen" type="text" placeholder="Nombre Pendencia..." class="form-control"  >
        @error('nombredepen')
          <small class="form-text text-white">{{ $message }}</small>
        @enderror
    </div>
    <button wire:click="update()" type="submit" class="btn btn-primary">Actualizar</button>
    
 </div>
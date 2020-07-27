<div class="mx-auto col-4 mb-2 p-4 bg-secondary rounded text-white ">
    <div class="form-group">
        <label>Nombre Uso</label>
        <input wire:model="nombrerubro" type="text" placeholder="Nombre Uso.." class="form-control"  >
        @error('nombrerubro')
          <small class="form-text text-white">{{ $message }}</small>
        @enderror
    </div>
    <div class="form-group">
        <label>Codigo</label>
        <input wire:model="codigo" type="text" placeholder="Codigo.." class="form-control"  >
        @error('codigo')
          <small class="form-text text-white">{{ $message }}</small>
        @enderror
    </div>
    <button wire:click="store()" type="submit" class="btn btn-primary">Crear</button>
 </div>
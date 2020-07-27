<div class="mx-auto col-4 mb-2 p-4 bg-secondary rounded text-white ">
    <div class="form-group">
        <label>Detalle Inter</label>
        <input wire:model="detalle_inter" type="text" placeholder="Detalle inter.." class="form-control"  >
        @error('detalle_inter')
          <small class="form-text text-white">{{ $message }}</small>
        @enderror
    </div>
    <div class="form-group">
        <label>Con Cargo a:</label>
        <input wire:model="con_cargo_a" type="text" placeholder="con cargo.." class="form-control"  >
        @error('con_cargo_a')
          <small class="form-text text-white">{{ $message }}</small>
        @enderror
    </div>
    <button wire:click="store()" type="submit" class="btn btn-primary">Crear</button>
 </div>
<div class="mx-auto col-4 mb-2 p-4 bg-secondary rounded text-white ">
    <div class="form-group">
        <label>Nobre Tipo Contrato</label>
        <input wire:model="nombretipo" type="text" placeholder="Nombre Tipo Contrato..." class="form-control"  >
        @error('nombretipo')
          <small class="form-text text-white">{{ $message }}</small>
        @enderror
    </div>
    <button wire:click="store()" type="submit" class="btn btn-primary">Crear</button>
 </div>
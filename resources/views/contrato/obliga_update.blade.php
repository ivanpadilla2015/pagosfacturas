<div class="d-flex justify-content-between ">
    <div class="form-group col-6 ">
        <label >Numeral</label><br>
        <input type="text" wire:model="numeral" class="form-control"  placeholder="Numeral..">
    </div>
    <div class="mt-4 ml-5">
        <button wire:click="update()" class="btn btn-success btn-sm  "  >Actualizar</button>
    </div>
</div>
<div class="form-row">
    <div class="form-group col-6">
        <label >Obligación</label>
        <textarea wire:model="obligacion_deta" class="form-control "  rows="3" ></textarea>
        @error('obligacion_deta')
          <small class="form-text text-danger">{{ $message }}</small>
        @enderror
    </div>
    <div class="form-group col-6 ">
        <label >Entregable</label>
        <textarea wire:model="entregable" class="form-control "  rows="3" ></textarea>
        @error('entregable')
          <small class="form-text text-danger">{{ $message }}</small>
        @enderror
    </div>
</div>

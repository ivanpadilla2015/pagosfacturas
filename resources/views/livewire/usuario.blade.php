<div class="card">
    <div class="card-header">
      Crear usuario
    </div>
    <div class="card-body">
        <div class="row ">
            <div class="form-group col">
              <label >Nombre</label> 
              <input wire:model="name" type="text" class="form-control" placeholder="Nombre usuario">
              @error('name')
                <small class="form-text text-danger">{{ $message }}</small>
             @enderror
            </div>
            <div class="form-group col">
                <label >Correo</label> 
                <input  type="email" class="form-control @error('email') is-invalid @enderror" wire:model="email" value="{{ old('email') }}" >
                @error('email')
                  <small class="form-text text-danger">{{ $message }}</small>
               @enderror
            </div>
            <div class="form-group col">
                <label >Password</label> 
                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" wire:model="password">
                @error('password')
                  <small class="form-text text-danger">{{ $message }}</small>
               @enderror
            </div>
            <div class="form-group col">
                <label >Dependencia</label>
                <select  wire:model="dependencia_id" class="form-control" >
                    <option value="0">Seleccione</option>
                    @foreach ($depen as $depe)
                      <option value="{{ $depe['id'] }}">{{ $depe['nombredepen'] }}</option>
                    @endforeach
                  </select>
                  @error('dependencia_id')
                      <small class="form-text text-danger">{{ $message }}</small>
                  @enderror
            </div>

          <button wire:click="store()" type="submit" class="btn btn-primary">Crear</button>
          <button wire:click.prevent="cancel()" class="btn btn-danger">Cancel</button>
    </div>
    </div>
  </div>
<div>
    
    <input type="text" wire:model="searchuso" class="form-control">

    <table class="table table-sm">
        <thead>
          <tr>
            <th class="col-sm-2">Codigo Uso</th>
            <th class="col-sm-5">Nombre Uso</th>
            <th class="col-sm-2 text-success">codigo Rubros</th>
            <th class="col-sm-10 text-success">Nombre Rubros</th>
          </tr>
        </thead>
        <tbody>
            @foreach ($result as $item)
              <tr>
                <td class="col-sm-2">{{ $item->codigo_uso}}</td>
                <td class="col-sm-5"><small>{{$item->nombre_uso}}</small></td>
                <td class="col-sm-2 ">{{$item->rubroprin->codigo_rubro}}</td>
                <td class="col-sm-10"> <small>{{$item->rubroprin->nombre_rubro}}</small></td>
              </tr>
            @endforeach
        </tbody>
      </table>
      {{ $result->links() }}
</div>

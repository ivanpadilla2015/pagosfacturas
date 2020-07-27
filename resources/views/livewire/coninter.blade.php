<div>
    @if($updateMode)
        @include('contra_inter.inter_update')
    @else
        @include('contra_inter.inter_create')
    @endif
     <div class="row d-flex justify-content-center">
      
      <table class="table table-sm col-6">
          <thead class="thead-dark">
            <tr>
              <th scope="col">#</th>
              <th scope="col">Nombre</th>
              <th scope="col">Con cargo</th>
              <th scope="col">Accion</th>
             
            </tr>
          </thead>
          <tbody>
            @forelse ($data as $item)
            <tr>
              <td class="col-1">{{ $item->id}}</td>
              <td class="col-3">{{ $item->detalle_inter }}</td>
              <td class="col-3">{{ $item->con_cargo_a }}</td>
              <td class="col-2">
                <button wire:click="edit({{ $item->id }})" class="btn bg-transparent esnsimasucc" title="Editar"><svg fill="none" width="15" height="15" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" stroke="currentColor" viewBox="0 0 24 24"><path d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg></button>
                <button wire:click="destroy({{ $item->id }})" onclick="confirm('Confirma Eliminarlo?') || event.stopImmediatePropagation()"  class="btn bg-transparent" title="Eliminar"><svg fill="none" width="15" height="15" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" stroke="currentColor" viewBox="0 0 24 24"><path d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg></button>
              </td>
              
            </tr>
            @empty
              <tr >
                  <td colspan="3" class="py-3 ">No hay información</td>
              </tr>
            @endforelse
          
          </tbody>
        </table>
      </div>
      <div class="row d-flex justify-content-center" >
        {{ $data->links() }}
      </div>
      
  </div>
  
  
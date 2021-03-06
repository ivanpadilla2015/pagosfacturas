<div>
    @if($createMode)

        @include('provedores.prove_create')
    @else
         @if($updateMode)
            @include('provedores.prove_update')
         @else
            <div class="card mt-2">
                <div class="card-header">
                    <h5 class="card-title">Proveedores</h5>
                </div>
                <div class="ml-auto m-2 ">
                    <button wire:click="$set('createMode', true)" class="btn btn-info" title="Crear Proveedor">
                        Crear Proveedor
                    </button>
                </div>
                
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th style="width:30%;">Nombre</th>
                            <th style="width:10%">Nit</th>
                            <th style="width:25%">Correo</th>
                            <th style="width:20%">telefono</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                       @forelse ($data as $item) 
                            <tr>
                                <td >{{$item->nombre}}</td>
                                <td >{{$item->nitproveedor}}</td>
                                <td >{{$item->email}}</td>
                                <td >{{$item->telefono}}</td>
                                <td >
                                    <button class="btn bg-transparent color" wire:click="edit({{ $item->id }})"><svg width="2em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M11.293 1.293a1 1 0 0 1 1.414 0l2 2a1 1 0 0 1 0 1.414l-9 9a1 1 0 0 1-.39.242l-3 1a1 1 0 0 1-1.266-1.265l1-3a1 1 0 0 1 .242-.391l9-9zM12 2l2 2-9 9-3 1 1-3 9-9z"/>
                                        <path fill-rule="evenodd" d="M12.146 6.354l-2.5-2.5.708-.708 2.5 2.5-.707.708zM3 10v.5a.5.5 0 0 0 .5.5H4v.5a.5.5 0 0 0 .5.5H5v.5a.5.5 0 0 0 .5.5H6v-1.5a.5.5 0 0 0-.5-.5H5v-.5a.5.5 0 0 0-.5-.5H3z"/>
                                        </svg></button>
                                    <button  wire:click="destroy({{ $item->id }})" onclick="confirm('Confirma Eliminarlo?') || event.stopImmediatePropagation()"  class="btn bg-transparent color" title="Eliminar"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                        </svg></button >
                                </td>
                            </tr>
                        @empty
                            <tr >
                                <td colspan="5" class="py-3 ">No hay información</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
                {{ $data->links() }}
            </div>

        @endif        
    @endif
</div>

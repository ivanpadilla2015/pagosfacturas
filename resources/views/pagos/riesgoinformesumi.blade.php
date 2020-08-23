@extends('layouts.admin')

@section('style')

@endsection

@section('content')
<div class="row">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-8">
                <div class="card">
                <h5 class="card-header">Listado Riesgos Informe No {{$info->id}} - Contrato: {{$info->contrato->numcontrato}} </h5>
                  <div class="card-body">
                    <a href="{{ url('admin')}}" class="btn btn-success btn-sm float-right">Finalizar Informe</a>
                                    <table class="table table-sm">
                                        <thead>
                                            <tr>
                                                <th style="width:10%">Tipo</th>
                                                <th style="width:40%">Descripcion</th>
                                                <th tyle="width:15%">Tratamiento</th>
                                                <th tyle="width:15%">Responsable</th>
                                                <th tyle="width:10%">Periodicidad</th>
                                                <th style="width:10%">Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            @foreach ($dato_ries as $item)
                                                <tr>
                                                    <td>{{ $item->tipo}}</td>
                                                    <td class="text-justify">{{ $item->descripcion}}</td>
                                                    <td class="text-justify">{{ $item->tratamiento}}</td>
                                                    <td class="text-justify">{{ $item->responsable}}</td>
                                                    <td class="text-justify">{{ $item->periodicidad}}</td>
                                                    <td>
                                                    <button class="btn bg-transparent esnsimasucc" title="Editar"  data-toggle="modal" data-target="#edit{{$item->id}}"><svg fill="none" width="15" height="15" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" stroke="currentColor" viewBox="0 0 24 24"><path d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg></button>
                                                        <button  class="btn bg-transparent" title="Eliminar"><svg fill="none" width="15" height="15" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" stroke="currentColor" viewBox="0 0 24 24"><path d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg></button>
                                                    </td>
                                                </tr>
                                                 <!-- Modal *************************************************-->
                                                    <div class="modal fade" id="edit{{$item->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Actualizar Riesgos  Informe No {{$info->id}}</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    
                                                                    <form action="{{ route('grabariesgoinfo', $item->id)}}" method="POST">
                                                                           @csrf
                                                                        <div class="d-flex justify-content-between ">
                                                                            <div class="form-group col-6 ">
                                                                                <label >Tipo</label><br>
                                                                                <input type="text" name="tipo" value="{{ $item->tipo }}" class="form-control"  placeholder="Tipo..">
                                                                            </div>
                                                                           
                                                                        </div>
                                                                        <div class="d-flex justify-content-between ">
                                                                            <div class="form-group col-6 ">
                                                                                <label >Descripción</label><br>
                                                                                <textarea name="descripcion"  class="form-control "  rows="3" >{{$item->descripcion}}</textarea>
                                                                            </div>
                                                                            <div class="form-group col-6 ">
                                                                                <label >Tratamiento</label><br>
                                                                                <textarea name="tratamiento"  class="form-control "  rows="3" >{{$item->tratamiento}}</textarea>
                                                                            </div>
                                                                        </div>
                                                                        
                                                                        <div class="form-row">
                                                                            <div class="form-group col-6">
                                                                                <label >Responsable</label>
                                                                                <input type="text" name="responsable" value="{{ $item->responsable }}" class="form-control"  placeholder="Tratamiento..">
                                                                            </div>
                                                                            <div class="form-group col-6 ">
                                                                                <label >Periodicidad</label>
                                                                                <input type="text" name="periodicidad" value="{{ $item->periodicidad }}" class="form-control"  placeholder="Periodicidad..">
                                                                            </div>
                                                                        </div>
                                                                                                                       
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                            <button type="submit" class="btn btn-primary">Grabar Cambios</button>
                                                                        </div>
                                                                    </form> 
                                                                </div>
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- fin modal     -->
                                            @endforeach 
                                        </tbody>
                                       
                                    </table>
                                    {{ $dato_ries->links() }} 
                     </div> <!-- Fin card-body  -->
                </div>
             </div>
        </div>
      </div>
      <!-- Button trigger modal -->
  
           
</div>

 @endsection

@extends('layouts.admin')

@section('style')

@endsection

@section('content')
<div class="row">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-8">
                <div class="card">
                   <h5 class="card-header">Listado Obligaciones</h5>
                  <div class="card-body">
                                    <table class="table table-sm">
                                        <thead>
                                            <tr>
                                                <th scope="col">Numeral</th>
                                                <th scope="col">Obligacion</th>
                                                <th scope="col">Entregable</th>
                                                <th scope="col">Handle</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            @foreach ($dato_obli as $item)
                                                <tr>
                                                    <td>{{ $item->numeral}}</td>
                                                    <td>{{ $item->obligacion_deta}}</td>
                                                    <td>{{ $item->entregable}}</td>
                                                    <td>
                                                        <button class="btn bg-transparent esnsimasucc" title="Editar" data-mynumeral="{{$item->numeral}}" data-myobligacion="{{$item->obligacion_deta}}" data-myentregable="{{$item->entregable}}" data-idobli={{$item->id}} data-toggle="modal" data-target="#edit"><svg fill="none" width="15" height="15" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" stroke="currentColor" viewBox="0 0 24 24"><path d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg></button>
                                                        <button  class="btn bg-transparent" title="Eliminar"><svg fill="none" width="15" height="15" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" stroke="currentColor" viewBox="0 0 24 24"><path d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg></button>
                                                    </td>
                                                </tr>
                                            @endforeach 
                                        </tbody>
                                    </table>

                     </div> <!-- Fin card-body  -->
                </div>
             </div>
        </div>
      </div>
      <!-- Button trigger modal -->
  
  <!-- Modal -->
  <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Actualizar Obligacion para el pago</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <form action="{{route('actualobli')}}" method="GET">
                <div class="d-flex justify-content-between ">
                    <div class="form-group col-6 ">
                        <label >Numeral</label><br>
                        <input type="text" name="numeral" id="numeral" class="form-control"  placeholder="Numeral..">
                    </div>
                    <div class="mt-4 ml-5">
                        <button  class="btn btn-success btn-sm  "  > Grabar</button>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group col-6">
                        <label >Obligación</label>
                        <textarea name="obligacion_deta" id="obliga" class="form-control "  rows="3" ></textarea>
                        @error('obligacion_deta')
                        <small class="form-text text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="form-group col-6 ">
                        <label >Entregable</label>
                        <textarea name="entregable" id="entrega" class="form-control "  rows="3" ></textarea>
                        @error('entregable')
                        <small class="form-text text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                </div>
                 <input type="hidden" name="id_obli" id="id_obli">
           
        
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form> 
          </div>
    </div>
  </div>
    </div>


 @endsection



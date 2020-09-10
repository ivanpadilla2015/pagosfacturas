@extends('layouts.admin')

@section('style')

@endsection

@section('content')
<div class="row">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-8">
                <div class="card">
                <h5 class="card-header">Listado Obligaciones Informe No {{$info->id}} - Contrato: {{$info->contrato->numcontrato}} </h5>
                  <div class="card-body">
                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal">
                        Mas Datos Del Informe
                      </button>
                    <a href="{{ route('verriesgoinfo', $info->id)}}" class="btn btn-success btn-sm float-right">Continuar Informe</a>
                                    <table class="table table-sm">
                                        <thead>
                                            <tr>
                                                <th style="width:10%">Numeral</th>
                                                <th style="width:40%">Obligacion</th>
                                                <th tyle="width:30%">Entregable</th>
                                                <th tyle="width:10%">Cumplio?</th>
                                                <th style="width:10%">Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            @foreach ($dato_obli as $item)
                                                <tr>
                                                    <td>{{ $item->numeral}}</td>
                                                    <td class="text-justify">{{ $item->obligacion_deta}}</td>
                                                    <td class="text-justify">{{ $item->entregable}}</td>
                                                    <td class="text-center text-danger">{{ $item->confirmar}}</td>
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
                                                                <h5 class="modal-title" id="exampleModalLabel">Actualizar Obligacion para el pago</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    
                                                                    <form action="{{ route('actualizasumi', $item->id)}}" method="POST">
                                                                           @csrf                                                                           
                                                                        <div class="d-flex justify-content-between ">
                                                                            <div class="form-group col-6 ">
                                                                                <label >Numeral</label><br>
                                                                                <input type="text" name="numeral" value="{{ $item->numeral }}" class="form-control"  placeholder="Numeral..">
                                                                            </div>
                                                                           
                                                                        </div>
                                                                        
                                                                        <div class="form-row">
                                                                            <div class="form-group col-6">
                                                                                <label >Obligación</label>
                                                                                <textarea name="obligacion_deta"  class="form-control "  rows="3" >{{$item->obligacion_deta}}</textarea>
                                                                                @error('obligacion_deta')
                                                                                <small class="form-text text-danger">{{ $message }}</small>
                                                                                @enderror
                                                                            </div>
                                                                            <div class="form-group col-6 ">
                                                                                <label >Entregable</label>
                                                                                <textarea name="entregable"  class="form-control "  rows="3" >{{$item->entregable}}</textarea>
                                                                                @error('entregable')
                                                                                <small class="form-text text-danger">{{ $message }}</small>
                                                                                @enderror
                                                                            </div>
                                                                        </div>
                                                                        <div class="d-flex justify-content-between ">
                                                                            <div class="form-group col-6 ">
                                                                                <label >Cumplio SI o NO</label><br>
                                                                                <input type="text" name="confirmar" value="{{ $item->confirmar }}" class="form-control"  placeholder="Confirmar..">
                                                                            </div>
                                                                           
                                                                        </div>
                                                                        <input type="hidden" name="id_obli" id="id_obli">
                                                                
                                                                
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
                                    {{ $dato_obli->links() }} 
                     </div> <!-- Fin card-body  -->
                </div>
             </div>
        </div>
      </div>
      <!-- Button trigger modal $pagodato -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Mas Datos del Informe</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('masdatos', $info->id)}}" method="POST">
                    @csrf   
                    <div class="row">
                        <div class="col">
                        <label>4. NOVEDADES DE INCUMPLIMIENTO EN LA EJECUCION </label>
                        <textarea name="novedad" id="" cols="10" rows="5" class="form-control">{{$info->novedad}}</textarea>
                        </div>
                       
                    </div>
                    <div class="row">
                        <div class="col">
                        <label>6.	INFORMACIÓN FIDUCIAS </label>
                        <textarea name="fiducia" id="" cols="10" rows="5" class="form-control">{{$info->fiducia}}</textarea>
                        </div>
                        <div class="col">
                        <label >7. INFORMACIÓN PERSONAL CONTRATADO </label>
                        <textarea name="infopersonal" id="" cols="10" rows="4" class="form-control">{{$info->infopersonal}}</textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                        <label>8. INFORMACIÓN AIU </label>
                        <textarea name="infoaiu" id="" cols="10" rows="5" class="form-control">{{$info->infoaiu}}</textarea>
                        
                        </div>
                        <div class="col">
                        <label >9. RECOMENDACIONES</label>
                        <textarea name="recomendacion" id="" cols="10" rows="5" class="form-control">{{$info->recomendacion}}</textarea>
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

  
           
</div>

 @endsection

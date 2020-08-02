@extends('layouts.admin_reportes')

@section('style')

@endsection

@section('content_reporte')

<form class="" action="/verpago" method="GET">
                        
    <div class="form-group mb-2">
      <label class="mr-1">Contrato</label>
        <select  class="form-control" name="contrato_id">
            <option value="0">Seleccione</option>
            @foreach ($datacon as $con)
            <option value="{{ $con['id'] }}">{{ $con->numcontrato.' '.$con->proveedor->nombre }}</option>
            @endforeach
        </select>
        <p class="text-danger">{{ $errors->first('pago_id') }}</p>
    </div>
    <div class="form-group ml-1">
        <button type="submit" class="btn  btn-primary btn-sm mb-2  ">Consultar</button>
    </div>
  </form>
  <div v-if="datos != ''">
      
  </div>

 @endsection

@section('script')

@endsection
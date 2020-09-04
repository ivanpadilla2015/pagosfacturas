@extends('layouts.admin_reportes')

@section('style')

@endsection

@section('content_reporte')

    <h5 class="card-header">Control Pago Total</h5>
     
    
    <form action="/verctrlpago" method="POST">
        @csrf
        <div class="border border-primary rounded m-2 py-2 pl-3 bg-light ">
            <h5 class="card-title mt-2 mr-1">Contrato:</h5> 
            <div class="form-inline mt-2">
                <input class="form-control form-control-sm " type="text" name="numcontrato" autofocus >
            </div>
            @error('numcontrato')
            <small class=" form-text text-danger">{{ $message }}</small>
            @enderror
       
        </div>
            <button type="submit"  class="btn btn-primary btn-sm ml-2" title="Bucar Contrato">Buscar</button>
    </form>




@endsection

@section('script')

@endsection
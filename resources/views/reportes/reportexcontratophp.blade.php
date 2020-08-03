@extends('layouts.admin_reportes')

@section('style')

@endsection

@section('content_reporte')

    <h5 class="card-header">Colsuta Contrato</h5>
     
    
    <form action="/verreporte" method="get">
        <div class="border border-primary rounded m-2 pl-3 bg-light ">
            <h5 class="card-title mt-2 mr-1">Contrato:</h5> 
            <div class="form-inline mt-2">
                <input class="form-control form-control-sm " type="text" name="numcontrato" autofocus >
            </div>
            @error('numcontrato')
            <small class=" form-text text-danger">{{ $message }}</small>
            @enderror
        
                <h5 class="card-title mt-2 mr-1">Rubros:</h5> 
                <div class="row my-2">
                    <div class="col">
                        <label >De:</label>
                        <input type="date" name="fechaini"  class="form-control" placeholder="First name">
                    </div>
                    <div class="col ">
                        <label >A:</label>
                        <input type="date" name="fechafin" class="form-control" placeholder="Last name">
                    </div>
                </div>
        </div>
            <button type="submit"  class="btn btn-primary btn-sm ml-2" title="Bucar Contrato">Buscar</button>
    </form>




@endsection

@section('script')

@endsection
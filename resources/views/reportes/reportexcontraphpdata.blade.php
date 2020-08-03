@extends('layouts.admin_reportes')

@section('style')

@endsection

@section('content_reporte')

@if ($data) 
            <div class="border border-primary rounded m-2 pl-3 bg-light "> 
                <div class="form-row ">
                    <div class="col">
                        <strong>Contrato No : </strong> <small>{{ $data->numcontrato}}</small>
                    </div>
                    <div class="col">
                        <strong>Valor Contrato : </strong> <small>{{ number_format($data->valorcontrato,2)}}</small>
                    </div>
                    <div class="col">
                        <strong>Saldo Cto : </strong> <small>{{ number_format($data->saldo,2)}}</small>
                    </div>
                </div>
                <div class="form-row  rounded">
                    <div class="col">
                    <strong>Fecha Cto : </strong> <small>{{ $data->fechacontrato}}</small>
                    </div>
                    <div class="col">
                    <strong>Prov: : </strong> <small>{{($data->proveedor->nombre)}}</small>
                    </div>
                    <div class="col">
                    <strong>Reg Pres : </strong> <small>{{ $data->registro_pres_inic}}</small>
                    </div>
                </div>
            </div>

            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre rubro</th>
                    <th scope="col">Total</th>
                    
                </tr>
                </thead>
                <tbody>
                    @php $c = 0; @endphp
                    @foreach ($rubro as  $item)
                        <tr>
                            <td>{{ $c += 1}}</td>
                            <td >{{ $item->nombre_rubro}}</td>
                            <td>{{number_format($item->total_fac)}}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
@endif

@endsection

@section('script')

@endsection
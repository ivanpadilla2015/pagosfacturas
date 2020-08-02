@extends('layouts.admin')

@section('style')

@endsection

@section('content')
<div id="app" class="container mt-2 ">
    <div class="row">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-8">
                    <div class="card">
                      <div class="card-body">
                            @yield('content_reporte')
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
 @endsection

@section('script')

@endsection
@extends('layouts.admin')

@section('style')

@endsection

@section('content')
<div  class="container mt-2 ">
    <div class="row">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-8">
                    <div class="card">
                      <div class="card-body">
                         <livewire:reportexcontrato>
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
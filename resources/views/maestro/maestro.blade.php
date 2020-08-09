@extends('layouts.admin')

@section('style')


@section('content')
<div class="container mt-2 ">
   <livewire:maestros>
</div>
 @endsection

 @section('script')
<script>
   window.livewire.on('alert', param => {
       toastr[param['type']](param['message'], param['type']);
   })
</script>
@endsection
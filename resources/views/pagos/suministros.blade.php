@extends('layouts.admin')

@section('style')

@endsection

@section('content')
<div class="container mt-2 ">
   <livewire:pagosuministros>
</div>
 @endsection

 @section('script')
<script>
   window.livewire.on('alert', param => {
       toastr[param['type']](param['message'], param['type']);
   })

   window.livewire.on('sweet-alert', message => {
    alert(message);
    // or whatever alerting library you'd like to use
})
</script>
@endsection
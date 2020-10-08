@extends('layouts.admin')

@section('style')
<style>
    .bg-transparent:hover {
        color: #FF0000;
    }
    
    .color {
        color: #1d68a7;
    }
</style>    
@endsection

@section('content')
<div class="container mt-2 ">
    
    <livewire:verinformes>   
  
   
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
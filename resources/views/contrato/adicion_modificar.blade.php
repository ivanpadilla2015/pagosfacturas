@extends('layouts.admin')

@section('style')

@endsection

@section('content')


<div class="container mt-2 ">
    
        <livewire:adiciomodificar>
  
</div>
 @endsection

@section('script')
<script>
   window.livewire.on('alert', param => {
       toastr[param['type']](param['message'], param['type']);
   })
</script>
@endsection

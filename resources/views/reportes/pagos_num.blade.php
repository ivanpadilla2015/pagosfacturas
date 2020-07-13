@extends('layouts.admin')

@section('style')
<style>
.bg-transparent:hover {
    color: #FF0000;
}

.color {
    color: #fa0404;
}
</style>    
@endsection

@section('content')
<div class="container mt-2 ">
   <livewire:pagonumero>
</div>
 @endsection

 @section('script')
<script>
   window.livewire.on('alert', param => {
       toastr[param['type']](param['message'], param['type']);
   })
</script>
@endsection
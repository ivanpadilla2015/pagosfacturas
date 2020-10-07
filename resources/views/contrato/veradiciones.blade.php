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
    <div class="row">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-8">
                    <div class="card">
                        <h5 class="card-header">Adiciones de Un contrato </h5>
                      <div class="card-body">

                        <livewire:veradiciones>
                           
                      </div> <!-- Fin card-body  -->
                    </div>
                  </div>
            </div>
        </div>
    </div>
   
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
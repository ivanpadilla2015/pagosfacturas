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
   <livewire:consulpro>
</div>
 @endsection
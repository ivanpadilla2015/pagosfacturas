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
    <div id="app" class="container mt-2  ">
        <pdfpagoxnumero></pdfpagoxnumero>
    </div>
 @endsection

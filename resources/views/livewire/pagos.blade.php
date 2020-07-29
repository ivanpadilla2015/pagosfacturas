<div>
    <div class="row">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-8">
                    <div class="card">
                      <div class="card-body">

                            @if($verMode)
                                @include('pagos.crearpago')
                            @else
                                @include('pagos.crearinforme')
                            @endif
                          
                      </div> <!-- Fin card-body  -->
                    </div>
                  </div>
            </div>
        </div>
    </div>
  </div>


@push('scripts')
    <script >
    function ShowSelected()
    {
      
      var combo = document.getElementById("producto");
      var selected = combo.options[combo.selectedIndex].text;
      document.getElementById("numro").value = selected;
      }
    
    </script>    
  @endpush





  
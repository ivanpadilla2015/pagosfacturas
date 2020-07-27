<div class="row">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-6">
                <div class="card">
                  <div class="card-body">

                        
                     <form class="" action="/verpago" method="GET">
                        
                        <div class="form-group mb-2">
                          <label class="mr-1">Pago No</label>
                            <select  class="form-control" name="pago_id">
                                <option value="0">Seleccione</option>
                                @foreach ($contra as $con)
                                <option value="{{ $con['id'] }}">{{"Pago No: ".$con['id']." Cto : ".$con->contrato->numcontrato }}</option>
                                @endforeach
                            </select>
                            <p class="text-danger">{{ $errors->first('pago_id') }}</p>
                        </div>
                        <div class="form-group ml-1">
                            <button type="submit" class="btn  btn-primary btn-sm mb-2  ">Consultar</button>
                        </div>
                      </form>
                    
                        
                  </div><!-- fin   -->
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-6">
                <div class="card">
                  <div class="card-body">

                        
                     <form class="" action="/verinfo" method="GET">
                        
                        <div class="form-group mb-2">
                          <label class="mr-1">Informe No</label>
                            <select  class="form-control" name="inforsumini_id">
                                <option value="0">Seleccione</option>
                                @foreach ($inform as $con)
                                <option value="{{ $con['id'] }}">{{"Informe No: ".$con['id']." Cto : ".$con->contrato->numcontrato." - Vlr Informe : ".number_format($con->total_info)}}</option>
                                @endforeach
                            </select>
                            <p class="text-danger">{{ $errors->first('pago_id') }}</p>
                        </div>
                        <div class="form-group">
                            <label>Firmado </label>
                            <select name="resp" class="form-control form-control-sm col-4">
                              <option value="1">Si</option>
                              <option value="2">No</option>
                            </select>
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
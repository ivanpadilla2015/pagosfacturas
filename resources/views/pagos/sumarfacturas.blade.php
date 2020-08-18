@if ($sumfac) <!--inicio totaliza factura   -->
    <button wire:click="mirar()" type="button" class="btn btn-primary btn-sm ml-5" data-toggle="modal" data-target="#exampleModal">
            Ver Total Facturas
    </button>
    <!-- Modal -->
        <div wire:ignore.self class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Totales</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true close-btn">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Factura</th>
                                    <th scope="col">Valor</th>
                                </tr>
                                </thead>
                                <tbody>
                                @php $c = 0; $s = 0; @endphp
                                @foreach ($sumfac as $item)
                                    @php $c += 1; $s += $item['total']; @endphp
                                    <tr>
                                    <th scope="row">{{$c}}</th>
                                    <td>{{ $item['numfac']}}</td>
                                    <td>{{ number_format($item['total'])}}</td>
                                    </tr>
                                @endforeach
                                    <tr>
                                    <th colspan="2" class="text-right" >Total</th>
                                    <td>{{ number_format($s) }}</td>
                                    </tr>
                                
                                </tbody>
                            </table>
                       
                </div>
        
                <div class="modal-footer">
        
                    <button type="button" class="btn btn-secondary close-btn" data-dismiss="modal">Cerrar</button>

                </div>
        
            </div>
        
        </div>
        
        </div>
@endif <!-- fin totaliza fac -->
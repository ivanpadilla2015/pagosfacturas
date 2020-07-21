<template>
    <div class="row">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-8">
                        <div class="card">
                          <div class="card-body">
        
                             <div class="form-group col">
                                <label >Pago No:</label>
                                <select name="pago_id"  class="form-control" >
                                    <option value="0">Seleccione</option>
                                    <option v-for="(item, index) in contra"  :key='index' >
                                    {{ "Pago No: "+item.id+" Cto : "}}</option>
                                   <!-- @foreach ($contra as $con)+" Prov.: "+$item.contrato.proveedor.nombre+"  Valor: "+number_format($item.total)
                                      <option value="{{ $con['id'] }}">{{"Pago No: ".$con['id']." Cto : ".$con->contrato->numcontrato." Prov.: ".$con->contrato->proveedor->nombre."  Valor: ".number_format($con->total) }}</option>
                                    @endforeach -->
                                  </select>
                            </div>
                                
                          </div><!-- card-body -->
                        </div><!-- card -->
                    </div><!-- col-8 -->
                </div><!--row d-flex justify-content-center -->
            </div><!--container -->
        </div><!--row-->
</template>

<script>
    export default {
        data(){
            return {
                contra : [],
            }
            
        },
        mounted() {
            console.log('Component mounted.')
        },

        created(){
           this.listadepago(); 
     
        },

        methods: {
            listadepago(){
                 axios.get('/pagxnum').then(resp=>{
                    this.contra = resp.data.pags;
                    console.log(this.contra);
               });
            }
            
        }    

    }
</script>

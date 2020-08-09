<template>
  <div>
      <div class="row my-2 p-10 col-10">
         <div class="col">
           <label >De:</label>
           <input type="date" v-model="fechaini"  class="form-control" placeholder="Fecha ini">
          </div>
          <div class="col ">
             <label >A:</label>
             <input type="date" v-model="fechafin" class="form-control" placeholder="fecha fin">
          </div>
       </div>
      
      <div class="form-group col">
        <label >Proveedor</label>
        <select v-model="provedor_id"  class="form-control" @change="busqueda(provedor_id)"  >
            <option value="0" >Seleccionar ............:</option>
            <option v-for="(item, index) in proves"  :key='index' :value="item.id">{{ item.nombre}} </option>
        </select>
      </div>
      <div v-if="datofacts.length != 0" class="border border-primary rounded m-1 pl-3 bg-light "> 
          
         <h5 class="card-title mt-2 mr-1">Facturas:</h5> <small class="float-right"> Total: {{ totalizar().toLocaleString() }}</small> 
         <table class="table table-sm">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Factura</th>
                    <th scope="col">Valor</th>
                    <th scope="col">Contrato</th>
                    <th scope="col">Pago</th>
                    <th scope="col">Fecha Pago</th>
                    
                </tr>
                </thead>
                <tbody>
                       <tr v-for="(item, index) in datofacts"  :key='index'>
                            <td>{{ index+1 }}</td>
                            <td >{{ item.numfac}}</td>
                            <td>{{ item.valorfac.toLocaleString()}}</td>
                            <td >{{ item.numcontrato}}</td>
                            <td >{{ item.pagonum}}</td>
                            <td >{{ item.fecha_pago}}</td>
                       </tr>
                   
                </tbody>
            </table>
            
            
      </div>
      
  </div>
    
</template>

<script>
export default {
    data() {
    return {
        proves : [],
        provedor_id: 0,
        datofacts:[],
        fechaini:'',
        fechafin:'',
        verdeta:false,
    }
    },

    created(){
          
          this.mostrarcontra(); 
     
        },
    methods:{

        mostrarcontra(){
            axios.get('/busproveevue').then(resp=>{
                    this.proves = resp.data;
                   // console.log(resp.data);
               });
        },
        busqueda(idp){
            
            this.datofacts = [];
            axios.post('/busfac',{params: {id: idp, fechaini: this.fechaini, fechafin: this.fechafin}}).then(respo=>{
                this.datofacts = respo.data.facts;
                //this.datorubro = respo.data.srubro;
                //this.datorubrodeta = respo.data.rubdeta;
                //console.log(respo.data.srubro);
            });

          },
          getverlo(){
            this.verdeta = !this.verdeta;
          },

           totalizar(){
               var total = 0;
               this.datofacts.forEach(function (task) {
                  total = total + task.valorfac;
              });
                return total;
	            }
    }
}
</script>

<style>

</style>
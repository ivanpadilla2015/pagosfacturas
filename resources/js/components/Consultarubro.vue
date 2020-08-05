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
        <label >Contrato</label>
        <select v-model="contrato_id"  class="form-control" @change="busqueda(contrato_id)"  >
            <option value="0" >Seleccionar ............:</option>
            <option v-for="(item, index) in contras"  :key='index' :value="item.id">{{ item.numcontrato+" "+item.proveedor.nombre+" Saldo: "+item.saldo.toLocaleString()}} </option>
        </select>
      </div>
      <div v-if="datocon!=''" class="border border-primary rounded m-1 pl-3 bg-light "> 
          <div class="form-row ">
            <div class="col">
              <strong>Contrato No : </strong> <small>{{ datocon.numcontrato}}</small>
            </div>
            <div class="col">
              <strong>Proveedor : </strong> <small>{{ datocon.proveedor.nombre}}</small>
            </div>
            <div class="col">
              <strong>Fecha Cto : </strong> <small>{{ datocon.fechacontrato}}</small>
            </div>
          </div>
          <div class="form-row  rounded">
             <div class="col">
              <strong>Valor Cto : </strong> <small>{{ datocon.valorcontrato.toLocaleString()}}</small>
            </div>
            <div class="col">
              <strong>Saldo : </strong> <small>{{(datocon.saldo.toLocaleString())}}</small>
            </div>
            <div class="col">
              <strong>Reg Pres : </strong> <small>{{ datocon.registro_pres_inic}}</small>
            </div>
         </div>
         <h5 class="card-title mt-2 mr-1">Rubros:</h5> 
         <table class="table table-sm">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre rubro</th>
                    <th scope="col">Total</th>
                    
                </tr>
                </thead>
                <tbody>
                       <tr v-for="(item, index) in datorubro"  :key='index'>
                            <td>{{ index+1 }}</td>
                            <td >{{ item.nombre_rubro}}</td>
                            <td>{{ item.total_fac.toLocaleString()}}</td>
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
        contras : [],
        contrato_id: 0,
        datocon:'',
        datorubro:[],
        fechaini:'',
        fechafin:'',
    }
    },

    created(){
          
          this.mostrarcontra(); 
     
        },
    methods:{

        mostrarcontra(){
            axios.get('/buscontratovue').then(resp=>{
                    this.contras = resp.data;
                   // console.log(resp.data);
               });
        },
        busqueda(idp){
            
            this.datocon = '';
            axios.get('/busrub',{params: {id: idp, fechaini: this.fechaini, fechafin: this.fechafin}}).then(respo=>{
                this.datocon = respo.data.data;
                this.datorubro = respo.data.srubro;
                //console.log(respo.data.srubro);
            });

          },
    }
}
</script>

<style>

</style>
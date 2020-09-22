<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContratosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('concargos', function (Blueprint $table) {
            $table->id();
            $table->string('detalle_inter');
            $table->string('con_cargo_a');
            $table->timestamps();
        });

      

        Schema::create('contratos', function (Blueprint $table) {
            $table->id();
            $table->string('numcontrato', 50)->unique();
            $table->double('valorcontrato', 20, 2);
            $table->double('valoranticipo', 20, 2)->nullable();
            $table->date('fecha_anticipo')->nullable();
            $table->float('amortizar', 5, 2)->nullable();
            $table->double('valoradicion', 20, 2)->nullable();
            $table->double('gran_total', 20, 2)->nullable();
            $table->string('registro_pres_inic', 50)->nullable();
            $table->date('fechacontrato');
            $table->date('plazoejecucion');
            $table->date('newplazoejecucion')->nullable();
            $table->string('interadmi', 150)->nullable();
            $table->text('objetocontrato');
            $table->double('saldo', 20, 2);
            $table->boolean('status')->default(true);
            $table->boolean('contabla')->default(false);
            $table->bigInteger('pagos')->default(0); // para llevar consecutivo de pagos
            $table->bigInteger('num_mes')->default(0); // para saber desde que mes enpezaron los pagos
            $table->float('ejecutado', 5, 2)->nullable(); //porcentaje ejecutado del contrato
            $table->string('supervisor')->nullable(); 
            $table->bigInteger('sum_conse')->nullable(); //para informe suministro
            $table->boolean('sumiministro')->nullable(); 
            $table->timestamps();

            $table->foreignId('proveedor_id')->constrained();
            $table->foreignId('tipocontrato_id')->constrained();
            $table->foreignId('dependencia_id')->constrained();
            $table->foreignId('concargo_id')->constrained();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contratos');
        Schema::dropIfExists('concargos');
    }
}

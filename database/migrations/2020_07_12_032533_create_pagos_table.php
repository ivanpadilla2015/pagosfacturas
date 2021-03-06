<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePagosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       Schema::create('pagos', function (Blueprint $table) {
            $table->id();
            $table->date('fecha_pago');
            $table->double('total',20,2);
            $table->double('saldo_viene',20,2);
            $table->double('gran_total',20,2);
            $table->string('pago_corresponde_mes');
            $table->string('porcentaje_cumplimiento');
            $table->string('mes_ejecucion')->nullable();
            $table->string('consecu_informe'); //para consecutivo pago pago
            $table->date('fecha_plazoeje')->nullable();
            $table->string('registroadicion')->nullable();
            $table->string('director', 120);
            $table->string('cargo_director', 120);
            $table->bigInteger('sum_conse')->nullable(); //para informe sumnistro
            $table->timestamps();

            $table->foreignId('contrato_id')->constrained();
            $table->foreignId('user_id')->constrained();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pagos');
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateObligaPagosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('obliga_pagos', function (Blueprint $table) {
            $table->id();
            $table->string('numeral')->nullable();
            $table->text('obligacion_deta');
            $table->string('entregable');
            $table->string('mes_ejecucion');
            $table->timestamps();

            $table->foreignId('pago_id')->constrained();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('obliga_pagos');
    }
}

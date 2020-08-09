<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRiesgoPagosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('riesgo_pagos', function (Blueprint $table) {
            $table->id();
            $table->string('tipo', 50);
            $table->text('descripcion');
            $table->text('tratamiento');
            $table->string('responsable', 70);
            $table->string('periodicidad', 50);
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
        Schema::dropIfExists('riesgo_pagos');
    }
}

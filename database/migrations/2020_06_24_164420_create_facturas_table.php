<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFacturasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('facturas', function (Blueprint $table) {
            $table->id();
            $table->string('numfac')->unique();
            $table->date('fechafac');
            $table->double('valorfac', 20, 2);
            $table->boolean('status')->default(true);
            $table->timestamps();

            $table->foreignId('contrato_id')->constrained();
            $table->foreignId('dependencia_id')->constrained();
            $table->foreignId('rubro_id')->constrained();
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
        Schema::dropIfExists('facturas');
    }
}

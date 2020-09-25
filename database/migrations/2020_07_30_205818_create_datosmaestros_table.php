<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDatosmaestrosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('datosmaestros', function (Blueprint $table) {
            $table->id();
            $table->string('director', 120);
            $table->string('cargo_director', 120);
            $table->string('presupuesto', 120);
            $table->string('cargo_presupuesto', 120);
            $table->string('ciudad')->nullable();
            $table->text('detalle1');
            $table->text('detalle2');//control obligacion
            $table->text('detalle3');//novedades incumplimiento
            $table->text('detalle4');//informacion fiducia
            $table->text('detalle5');//informacion personal
            $table->text('detalle6');//recomendaciones
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('datosmaestros');
    }
}

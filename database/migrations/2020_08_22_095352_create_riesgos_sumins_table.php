<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRiesgosSuminsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('riesgos_sumins', function (Blueprint $table) {
            $table->id();
            $table->string('tipo', 50);
            $table->text('descripcion');
            $table->text('tratamiento');
            $table->string('responsable', 70);
            $table->string('periodicidad', 50);
            $table->timestamps();

            $table->foreignId('inforsumini_id')->constrained();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('riesgos_sumins');
    }
}

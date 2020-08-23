<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateObligaSuminsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('obliga_sumins', function (Blueprint $table) {
            $table->id();
            $table->string('numeral')->nullable();
            $table->text('obligacion_deta');
            $table->string('entregable');
            $table->string('mes_ejecucion');
            $table->string('confirmar')->nullable();
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
        Schema::dropIfExists('obliga_sumins');
    }
}

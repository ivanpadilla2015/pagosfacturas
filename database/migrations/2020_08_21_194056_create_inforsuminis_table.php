<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInforsuminisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inforsuminis', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('sum_conse');
            $table->double('total_info',20,2);
            $table->double('saldo_viene',20,2);
            $table->double('gran_total',20,2);
            $table->string('porcentaje_cumplimiento');
            $table->string('mes_ejecucion');
            $table->string('corresponde_periodo');
            $table->date('fechainfo');
            $table->string('director', 120);
            $table->string('cargo_director', 120);
            $table->text('novedad')->nullable();
            $table->text('fiducia')->nullable();
            $table->text('infopersonal')->nullable();
            $table->text('infoaiu')->nullable();
            $table->text('recomendacion')->nullable();
            $table->timestamps();
            $table->foreignId('contrato_id')->constrained();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('inforsuminis');
    }
}

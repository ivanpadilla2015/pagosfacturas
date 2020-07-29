<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateObligacionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('obligacions', function (Blueprint $table) {
            $table->id();
            $table->string('numeral')->nullable();
            $table->text('obligacion_deta');
            $table->string('entregable');
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
        Schema::dropIfExists('obligacions');
    }
}

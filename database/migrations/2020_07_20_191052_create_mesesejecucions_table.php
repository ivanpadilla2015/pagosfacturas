<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMesesejecucionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mesesejecucions', function (Blueprint $table) {
            $table->id();
            $table->string('numeral');
            $table->string('obligacion');
            $table->string('entregable');
            $table->string('ene', 1)->nullable();
            $table->string('feb', 1)->nullable();
            $table->string('mar', 1)->nullable();
            $table->string('abr', 1)->nullable();
            $table->string('may', 1)->nullable();
            $table->string('jun', 1)->nullable();
            $table->string('jul', 1)->nullable();
            $table->string('ago', 1)->nullable();
            $table->string('sep', 1)->nullable();
            $table->string('oct', 1)->nullable();
            $table->string('nov', 1)->nullable();
            $table->string('dic', 1)->nullable();
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
        Schema::dropIfExists('mesesejecucions');
    }
}

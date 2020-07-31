<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRubrocontratosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rubrocontratos', function (Blueprint $table) {
            $table->id();
            $table->double('valorrubro', 20, 2)->nullable();
            $table->timestamps();

            $table->foreignId('contrato_id')->constrained();
            $table->foreignId('rubroprin_id')->constrained();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('rubrocontratos');
    }
}

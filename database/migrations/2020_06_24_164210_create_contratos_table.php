<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContratosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contratos', function (Blueprint $table) {
            $table->id();
            $table->string('numcontrato', 50)->unique();
            $table->double('valorcontrato', 20, 2);
            $table->double('valoranticipo', 20, 2)->nullable();
            $table->date('fecha_anticipo')->nullable();
            $table->float('amortizar', 5, 2)->nullable();
            $table->double('valoradicion', 20, 2)->nullable();
            $table->string('registro_pres_inic', 50)->nullable();;
            $table->date('fechacontrato');
            $table->date('plazoejecucion');
            $table->string('interadmi', 150)->nullable();
            $table->text('objetocontrato');
            $table->double('saldo', 20, 2);
            $table->boolean('status')->default(true);
            $table->boolean('contabla')->default(false);
            $table->bigInteger('pagos')->nullable(); // para llevar consecutivo de pagos
            $table->timestamps();

            $table->foreignId('proveedor_id')->constrained();
            $table->foreignId('tipocontrato_id')->constrained();
            $table->foreignId('dependencia_id')->constrained();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contratos');
    }
}

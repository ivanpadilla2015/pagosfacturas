<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFactudetadisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('factudetadis', function (Blueprint $table) {
            $table->id();
            $table->string('registroadicion');
            $table->date('fechaadicion');
            $table->double('valoradicion',20,2);
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
        Schema::dropIfExists('factudetadis');
    }
}

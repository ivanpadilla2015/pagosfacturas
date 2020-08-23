<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInformeadisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('informeadis', function (Blueprint $table) {
            $table->id();
            $table->string('registroadicion');
            $table->date('fechaadicion');
            $table->double('valoradicion',20,2);
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
        Schema::dropIfExists('informeadis');
    }
}

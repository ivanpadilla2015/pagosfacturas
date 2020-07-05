<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProveedorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('proveedors', function (Blueprint $table) {
            $table->id();
            $table->string('nombre');
            $table->string('nitproveedor', 50)->unique();
            $table->string('digver', 1)->nullable();
            $table->string('email',100)->unique()->nullable();
            $table->string('telefono', 100)->nullable();
            $table->string('direccion');
            $table->string('reprelegal')->nullable();
            $table->string('contacto', 100)->nullable();
            $table->string('cuenta')->nullable();
            $table->enum('tipoper',['Juridica','Natural']);
            $table->boolean('regimensimpli')->default(0);
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
        Schema::dropIfExists('proveedors');
    }
}

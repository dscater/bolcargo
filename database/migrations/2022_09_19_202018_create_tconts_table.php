<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTcontsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tconts', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("cliente_id");
            $table->string("container_nro", 255);
            $table->string("container_nro2", 255)->nullable();
            $table->string("container_nro3", 255)->nullable();
            $table->string("container_nro4", 255)->nullable();
            $table->decimal("total_ingresos", 24, 2);
            $table->decimal("total_egresos", 24, 2);
            $table->decimal("profit", 24, 2);
            $table->date("fecha_registro");
            $table->timestamps();
            $table->foreign("cliente_id")->on("clientes")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tconts');
    }
}

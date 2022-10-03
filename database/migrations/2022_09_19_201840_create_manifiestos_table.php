<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateManifiestosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('manifiestos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("cliente_id");
            $table->unsignedBigInteger("shipper_id");
            $table->text("consignee");
            $table->string("ocean_vessel", 255);
            $table->string("voyage_nro", 255);
            $table->string("port_discharge");
            $table->date("date_issue");
            $table->string("place_issue", 255);
            $table->text("marcas_numeros");
            $table->text("descripcion");
            $table->double("peso", 24, 2);
            $table->text("shipper_texto");
            $table->text("consignee2");
            $table->string("ocean_vessel2", 255);
            $table->string("voyage_nro2", 255);
            $table->string("place_issue2", 255);
            $table->text("mbl_hbl");
            $table->text("marcas_numeros2");
            $table->text("descripcion2");
            $table->double("peso2", 24, 2);
            $table->date("fecha_registro");
            $table->timestamps();

            $table->foreign("cliente_id")->on("clientes")->references("id");
            $table->foreign("shipper_id")->on("shippers")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('manifiestos');
    }
}

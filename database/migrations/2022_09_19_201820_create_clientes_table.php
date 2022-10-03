<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClientesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clientes', function (Blueprint $table) {
            $table->id();
            $table->string("file_nro", 255)->unique();
            $table->unsignedBigInteger("tipo_embarque_id");
            $table->string("venta", 255);
            $table->unsignedBigInteger("oficina_id");
            $table->string("cliente", 255);
            $table->string("cnee", 255);
            $table->string("contacto", 255);
            $table->string("dir", 255);
            $table->string("ciudad", 255);
            $table->string("fono", 255);
            $table->string("fax", 255);
            $table->string("nro_nit", 255);
            $table->string("master", 255);
            $table->string("house", 255);
            $table->string("documentos_cp", 10);
            $table->string("hbl_ai_cnee_fletado", 10);
            $table->string("flete_menor", 10);
            $table->string("cuanto", 10);
            $table->string("puerto_embarque", 255);
            $table->unsignedBigInteger("puerto_destino_id");
            $table->unsignedBigInteger("destino_final_id");
            $table->date("etd");
            $table->date("eta");
            $table->integer("nro_total1");
            $table->unsignedBigInteger("units_id1");
            $table->string("nro_total2", 255);
            $table->unsignedBigInteger("units_id2");
            $table->unsignedBigInteger("socio_proveedor_id");
            $table->unsignedBigInteger("embarcado_id");
            $table->string("flete_master", 255);
            $table->string("flete_house", 255);
            $table->text("notas");
            $table->decimal("total_ingresos", 24, 2);
            $table->decimal("total_egresos", 24, 2);
            $table->decimal("profit", 24, 2);
            $table->date("fecha_registro");
            $table->timestamps();

            $table->foreign("tipo_embarque_id")->on("tipo_embarques")->references("id");
            $table->foreign("oficina_id")->on("oficinas")->references("id");
            $table->foreign("puerto_destino_id")->on("puerto_destinos")->references("id");
            $table->foreign("destino_final_id")->on("destino_finals")->references("id");
            $table->foreign("units_id1")->on("units")->references("id");
            $table->foreign("units_id2")->on("units")->references("id");
            $table->foreign("socio_proveedor_id")->on("socio_proveedors")->references("id");
            $table->foreign("embarcado_id")->on("embarcados")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('clientes');
    }
}

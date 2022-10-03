<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTcontIngresosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tcont_ingresos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("tcont_id");
            $table->unsignedBigInteger("documento_id");
            $table->bigInteger("nro");
            $table->decimal("monto", 24, 2);
            $table->timestamps();
            $table->foreign("tcont_id")->on("tconts")->references("id");
            $table->foreign("documento_id")->on("documentos")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tcont_ingresos');
    }
}

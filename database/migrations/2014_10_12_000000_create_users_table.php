<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('usuario', 255)->unique();
            $table->string('nombre');
            $table->string('paterno');
            $table->string('materno')->nullable();
            $table->string('ci')->unique();
            $table->string('ci_exp', 40);
            $table->string('dir', 255);
            $table->string('correo')->nullable();
            $table->string('fono');
            $table->string('cel');
            $table->enum('tipo', ["ADMINISTRADOR", "AUXILIAR"]);
            $table->string('foto', 255)->nullable();
            $table->string('password');
            $table->date('fecha_registro');
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
        Schema::dropIfExists('users');
    }
}

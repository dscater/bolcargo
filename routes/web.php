<?php

use App\Http\Controllers\CertificadoCollectController;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\ConfiguracionController;
use App\Http\Controllers\GetListasController;
use App\Http\Controllers\HblController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\ManifiestoController;
use App\Http\Controllers\NotaCobranzaController;
use App\Http\Controllers\ReporteController;
use App\Http\Controllers\TcontController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// LOGIN
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout']);

// CONFIGURACIÓN
Route::get('/configuracion/getConfiguracion', [ConfiguracionController::class, 'getConfiguracion']);
Route::post('/configuracion/update', [ConfiguracionController::class, 'update']);


Route::prefix('admin')->group(function () {
    // USUARIOS
    Route::get('usuarios/getUsuario/{usuario}', [UserController::class, 'getUsuario']);
    Route::get('usuarios/userActual', [UserController::class, 'userActual']);
    Route::get('usuarios/getInfoBox', [UserController::class, 'getInfoBox']);
    Route::get('usuarios/getPermisos/{usuario}', [UserController::class, 'getPermisos']);
    Route::get('usuarios/getEncargadosRepresentantes', [UserController::class, 'getEncargadosRepresentantes']);
    Route::post('usuarios/actualizaContrasenia/{usuario}', [UserController::class, 'actualizaContrasenia']);
    Route::post('usuarios/actualizaFoto/{usuario}', [UserController::class, 'actualizaFoto']);
    Route::resource('usuarios', UserController::class)->only([
        'index', 'store', 'update', 'destroy', 'show'
    ]);

    // LISTAS
    Route::get('get_listas/listaTipoEmbarques', [GetListasController::class, 'listaTipoEmbarques']);
    Route::get('get_listas/listaOificinas', [GetListasController::class, 'listaOificinas']);
    Route::get('get_listas/listaPuertosDestinos', [GetListasController::class, 'listaPuertosDestinos']);
    Route::get('get_listas/listaDestinoFinals', [GetListasController::class, 'listaDestinoFinals']);
    Route::get('get_listas/listaUnits', [GetListasController::class, 'listaUnits']);
    Route::get('get_listas/listSociosProveedores', [GetListasController::class, 'listSociosProveedores']);
    Route::get('get_listas/listaEmbarcados', [GetListasController::class, 'listaEmbarcados']);
    Route::get('get_listas/listaShippers', [GetListasController::class, 'listaShippers']);
    Route::get('get_listas/listaDocumentos', [GetListasController::class, 'listaDocumentos']);

    // CLIENTES
    Route::post('clientes/pdf/{cliente}', [ClienteController::class, 'pdf']);
    Route::get('clientes/getCliente/{cliente}', [ClienteController::class, 'getCliente']);
    Route::delete('clientes/destroy_ei', [ClienteController::class, 'destroy_ei']);
    Route::resource('clientes', ClienteController::class)->only([
        'index', 'store', 'update', 'destroy', 'show'
    ]);

    // MANIFIESTOS
    Route::post('manifiestos/pdf/{manifiesto}', [ManifiestoController::class, 'pdf']);
    Route::get('manifiestos/getManifiesto/{manifiesto}', [ManifiestoController::class, 'getManifiesto']);
    Route::resource('manifiestos', ManifiestoController::class)->only([
        'index', 'store', 'update', 'destroy', 'show'
    ]);

    // H BL
    Route::post('hbls/pdf', [HblController::class, 'pdf']);

    // NOTA COBRANZAS
    Route::post('nota_cobranzas/pdf/{nota_cobranza}', [NotaCobranzaController::class, 'pdf']);
    Route::get('nota_cobranzas/getNotaCobranza/{nota_cobranza}', [NotaCobranzaController::class, 'getNotaCobranza']);
    Route::resource('nota_cobranzas', NotaCobranzaController::class)->only([
        'index', 'store', 'update', 'destroy', 'show'
    ]);

    // CERTIFICADO COLLECT
    Route::post('certificado_collect/pdf', [CertificadoCollectController::class, 'pdf']);

    // TCONTS
    Route::post('tconts/pdf/{tcont}', [TcontController::class, 'pdf']);
    Route::get('tconts/getTcont/{tcont}', [TcontController::class, 'getTcont']);
    Route::delete('tconts/destroy_ei', [TcontController::class, 'destroy_ei']);
    Route::resource('tconts', TcontController::class)->only([
        'index', 'store', 'update', 'destroy', 'show'
    ]);

    // REPORTES
    Route::post('reportes/usuarios', [ReporteController::class, 'usuarios']);
    Route::post('reportes/clientes', [ReporteController::class, 'clientes']);
    Route::post('reportes/ingresos_egresos', [ReporteController::class, 'ingresos_egresos']);
});

// ---------------------------------------
Route::get('/{optional?}', function () {
    return view('app');
})->name('base_path')->where('optional', '.*');

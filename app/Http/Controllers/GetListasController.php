<?php

namespace App\Http\Controllers;

use App\Models\DestinoFinal;
use App\Models\Documento;
use App\Models\Embarcado;
use App\Models\Oficina;
use App\Models\PuertoDestino;
use App\Models\Shipper;
use App\Models\SocioProveedor;
use App\Models\TipoEmbarque;
use App\Models\Unit;
use Illuminate\Http\Request;

class GetListasController extends Controller
{
    public function listaTipoEmbarques()
    {
        $tipo_embarques = TipoEmbarque::all();
        return response()->JSON($tipo_embarques);
    }

    public function listaOificinas()
    {
        $oficinas = Oficina::all();
        return response()->JSON($oficinas);
    }

    public function listaPuertosDestinos()
    {
        $puerto_destinos = PuertoDestino::all();
        return response()->JSON($puerto_destinos);
    }

    public function listaDestinoFinals()
    {
        $destino_finals = DestinoFinal::all();
        return response()->JSON($destino_finals);
    }

    public function listaUnits()
    {
        $units = Unit::all();
        return response()->JSON($units);
    }

    public function listSociosProveedores()
    {
        $socio_proveedors = SocioProveedor::all();
        return response()->JSON($socio_proveedors);
    }

    public function listaEmbarcados()
    {
        $embarcados = Embarcado::all();
        return response()->JSON($embarcados);
    }

    public function listaShippers()
    {
        $shippers = Shipper::all();
        return response()->JSON($shippers);
    }

    public function listaDocumentos()
    {
        $documentos = Documento::all();
        return response()->JSON($documentos);
    }
}

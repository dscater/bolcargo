<?php

namespace App\Http\Controllers;

use App\Models\Manifiesto;
use Illuminate\Http\Request;
use PDF;

class ManifiestoController extends Controller
{
    public $validacion = [
        'cliente_id' => 'required',
        'shipper_id' => 'required',
        'consignee' => 'required',
        'ocean_vessel' => 'required',
        'voyage_nro' => 'required',
        'port_discharge' => 'required',
        'date_issue' => 'required',
        'place_issue' => 'required',
        'marcas_numeros' => 'required',
        'descripcion' => 'required',
        'peso' => 'required',
        'shipper_texto' => 'required',
        'consignee2' => 'required',
        'ocean_vessel2' => 'required',
        'voyage_nro2' => 'required',
        'place_issue2' => 'required',
        'mbl_hbl' => 'required',
        'marcas_numeros2' => 'required',
        'descripcion2' => 'required',
        'peso2' => 'required',
    ];

    public $messages = [];

    public function index(Request $request)
    {
        $manifiestos = Manifiesto::all();
        return response()->JSON(['manifiestos' => $manifiestos, 'total' => count($manifiestos)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->messages);
        $existe_manifiesto = Manifiesto::where('cliente_id', $request->cliente_id)->get()->first();
        if ($existe_manifiesto) {
            return response()->JSON([
                'msj' => 'El código de cliente que selecciono ya cuenta con un registro de manifiesto',
            ], 400);
        }
        $request['fecha_registro'] = date('Y-m-d');
        // CREAR EL MANIFIESTO
        $manifiesto = Manifiesto::create(array_map('mb_strtoupper', $request->all()));
        return response()->JSON([
            'sw' => true,
            'manifiesto' => $manifiesto,
            'msj' => 'El registro se realizó de forma correcta',
        ], 200);
    }

    public function getManifiesto(Manifiesto $manifiesto)
    {
        return response()->JSON($manifiesto);
    }

    public function update(Request $request, Manifiesto $manifiesto)
    {
        $request->validate($this->validacion, $this->messages);

        $manifiesto->update(array_map('mb_strtoupper', $request->all()));

        return response()->JSON([
            'sw' => true,
            'manifiesto' => $manifiesto,
            'msj' => 'El registro se actualizó de forma correcta'
        ], 200);
    }

    public function show(Manifiesto $manifiesto)
    {
        return response()->JSON([
            'sw' => true,
            'manifiesto' => $manifiesto
        ], 200);
    }

    public function destroy(Manifiesto $manifiesto)
    {
        $manifiesto->delete();
        return response()->JSON([
            'sw' => true,
            'msj' => 'El registro se eliminó correctamente'
        ], 200);
    }

    public function pdf(Manifiesto $manifiesto)
    {
        $pdf = PDF::loadView('reportes.manifiesto', compact('manifiesto'))->setPaper('legal', 'landscape');
        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 10, array(0, 0, 0));

        return $pdf->download('Manifiesto.pdf');
    }
}

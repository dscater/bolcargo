<?php

namespace App\Http\Controllers;

use App\Models\NotaCobranza;
use Illuminate\Http\Request;
use PDF;
use App\library\numero_a_letras\src\NumeroALetras;

class NotaCobranzaController extends Controller
{
    public $validacion = [
        'cliente_id' => 'required',
        'date' => 'required',
        'ref' => 'required',
    ];

    public $messages = [];

    public function index(Request $request)
    {
        $nota_cobranzas = NotaCobranza::all();
        return response()->JSON(['nota_cobranzas' => $nota_cobranzas, 'total' => count($nota_cobranzas)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->messages);
        // CREAR EL REGISTRO
        $nota_cobranza = NotaCobranza::create(array_map('mb_strtoupper', $request->all()));
        return response()->JSON([
            'sw' => true,
            'nota_cobranza' => $nota_cobranza,
            'msj' => 'El registro se realizó de forma correcta',
        ], 200);
    }

    public function getNotaCobranza(NotaCobranza $nota_cobranza)
    {
        return response()->JSON($nota_cobranza);
    }

    public function update(Request $request, NotaCobranza $nota_cobranza)
    {
        $request->validate($this->validacion, $this->messages);

        $nota_cobranza->update(array_map('mb_strtoupper', $request->all()));

        return response()->JSON([
            'sw' => true,
            'nota_cobranza' => $nota_cobranza,
            'msj' => 'El registro se actualizó de forma correcta'
        ], 200);
    }

    public function show(NotaCobranza $nota_cobranza)
    {
        return response()->JSON([
            'sw' => true,
            'nota_cobranza' => $nota_cobranza
        ], 200);
    }

    public function destroy(NotaCobranza $nota_cobranza)
    {
        $nota_cobranza->delete();
        return response()->JSON([
            'sw' => true,
            'msj' => 'El registro se eliminó correctamente'
        ], 200);
    }

    public function pdf(NotaCobranza $nota_cobranza)
    {
        $convertir = new NumeroALetras();
        $array_monto = explode('.', number_format((float)$nota_cobranza->cliente->total_ingresos, 2, '.', ','));
        $literal = $convertir->convertir($array_monto[0]);
        $literal .= " " . $array_monto[1] . "/100";

        $pdf = PDF::loadView('reportes.nota_cobranza', compact('nota_cobranza', 'literal'))->setPaper('legal', 'portrait');
        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 10, array(0, 0, 0));

        return $pdf->download('NotaCobranza.pdf');
    }
}

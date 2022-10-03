<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use Illuminate\Http\Request;
use PDF;

class HblController extends Controller
{
    public function pdf(Request $request)
    {
        $request->validate([
            'cliente_id' => 'required',
            'tipo' => 'required'
        ]);

        $tipo = $request->tipo;
        $cliente = Cliente::findOrFail($request->cliente_id);

        $pdf = PDF::loadView('reportes.hbl', compact('cliente', 'tipo'))->setPaper('legal', 'portrait');
        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 100, $alto - 580, "PAGE {PAGE_NUM} OF {PAGE_COUNT}", null, 7, array(0, 0, 0));

        return $pdf->download('HBL.pdf');
    }
}

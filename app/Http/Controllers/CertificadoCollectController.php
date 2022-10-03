<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use Illuminate\Http\Request;
use PDF;

class CertificadoCollectController extends Controller
{
    public function pdf(Request $request)
    {
        $request->validate([
            'cliente_id' => 'required',
        ]);

        $cliente = Cliente::findOrFail($request->cliente_id);

        $pdf = PDF::loadView('reportes.certificado_collect', compact('cliente'))->setPaper('legal', 'portrait');
        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('HBL.pdf');
    }
}

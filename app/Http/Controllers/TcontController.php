<?php

namespace App\Http\Controllers;

use App\Models\Tcont;
use App\Models\TcontEgreso;
use App\Models\TcontIngreso;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use PDF;

class TcontController extends Controller
{
    public $validacion = [
        'cliente_id' => 'required',
        'container_nro' => 'required',
        'container_nro2' => 'nullable|min:1',
        'container_nro3' => 'nullable|min:1',
        'total_ingresos' => 'required',
        'total_egresos' => 'required',
        'profit' => 'required',

        'egresos_documento_id.*' => 'required',
        'egresos_nro.*' => 'required|numeric|min:1',
        'egresos_monto.*' => 'required|numeric|min:1',

        "ingresos_documento_id" => ["required", "array", "min:1"],
        'ingresos_documento_id.*' => 'required',
        'ingresos_nro.*' => 'required|numeric|min:1',
        'ingresos_monto.*' => 'required|numeric|min:1',
    ];

    public $messages = [
        'egresos_documento_id.*.required' => 'Este campo es obligatorio',
        'egresos_nro.*.required' => 'Este campo es obligatorio',
        'egresos_nro.*.numeric' => 'Debes ingresar un valor númerico',
        'egresos_nro.*.min' => 'Debes ingresar almenos :min',
        'egresos_monto.*.required' => 'Este campo es obligatorio',
        'egresos_monto.*.numeric' => 'Debes ingresar un valor númerico',
        'egresos_monto.*.min' => 'Debes ingresar al menos :min',
        'ingresos_documento_id.*.required' => 'Este campo es obligatorio',
        'ingresos_nro.*.required' => 'Este campo es obligatorio',
        'ingresos_nro.*.numeric' => 'Debes ingresar un valor númerico',
        'ingresos_nro.*.min' => 'Debes ingresar al menos :min',
        'ingresos_monto.*.required' => 'Este campo es obligatorio',
        'ingresos_monto.*.numeric' => 'Debes ingresar un valor númerico',
        'ingresos_monto.*.min' => 'Debes ingresar al menos :min',
    ];

    public function index(Request $request)
    {
        $tconts = Tcont::all();
        return response()->JSON(['tconts' => $tconts, 'total' => count($tconts)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->messages);
        $request['fecha_registro'] = date('Y-m-d');
        // CREAR EL CLIENTE
        $tcont = Tcont::create(array_map('mb_strtoupper', $request->except('egresos_documento_id', 'egresos_nro', 'egresos_monto', 'ingresos_documento_id', 'ingresos_nro', 'ingresos_monto')));

        $egresos_documento_id = $request->egresos_documento_id;
        $egresos_nro = $request->egresos_nro;
        $egresos_monto = $request->egresos_monto;
        if (isset($egresos_documento_id)) {
            for ($i = 0; $i < count($egresos_documento_id); $i++) {
                TcontEgreso::create([
                    'tcont_id' => $tcont->id,
                    'documento_id' => $egresos_documento_id[$i],
                    'nro' => $egresos_nro[$i],
                    'monto' => $egresos_monto[$i]
                ]);
            }
        }
        $ingresos_documento_id = $request->ingresos_documento_id;
        $ingresos_nro = $request->ingresos_nro;
        $ingresos_monto = $request->ingresos_monto;
        if (isset($ingresos_documento_id)) {
            for ($i = 0; $i < count($ingresos_documento_id); $i++) {
                TcontIngreso::create([
                    'tcont_id' => $tcont->id,
                    'documento_id' => $ingresos_documento_id[$i],
                    'nro' => $ingresos_nro[$i],
                    'monto' => $ingresos_monto[$i]
                ]);
            }
        }

        return response()->JSON([
            'sw' => true,
            'tcont' => $tcont,
            'msj' => 'El registro se realizó de forma correcta',
        ], 200);
    }

    public function getTcont(Tcont $tcont)
    {
        return response()->JSON($tcont);
    }

    public function update(Request $request, Tcont $tcont)
    {
        $request->validate($this->validacion, $this->messages);

        $tcont->update(array_map('mb_strtoupper', $request->except('egresos_documento_id', 'egresos_nro', 'egresos_monto', 'ingresos_documento_id', 'ingresos_nro', 'ingresos_monto', 'egresos_existe', 'ingresos_existe')));

        $egresos_documento_id = $request->egresos_documento_id;
        $egresos_nro = $request->egresos_nro;
        $egresos_monto = $request->egresos_monto;
        $egresos_existe = $request->egresos_existe;
        if (isset($egresos_documento_id)) {
            for ($i = 0; $i < count($egresos_documento_id); $i++) {
                if ($egresos_existe[$i] == 0) {
                    TcontEgreso::create([
                        'tcont_id' => $tcont->id,
                        'documento_id' => $egresos_documento_id[$i],
                        'nro' => $egresos_nro[$i],
                        'monto' => $egresos_monto[$i]
                    ]);
                } else {
                    $egreso = TcontEgreso::find($egresos_existe[$i]);
                    $egreso->update([
                        'documento_id' => $egresos_documento_id[$i],
                        'nro' => $egresos_nro[$i],
                        'monto' => $egresos_monto[$i]
                    ]);
                }
            }
        }
        $ingresos_documento_id = $request->ingresos_documento_id;
        $ingresos_nro = $request->ingresos_nro;
        $ingresos_monto = $request->ingresos_monto;
        $ingresos_existe = $request->ingresos_existe;
        if (isset($ingresos_documento_id)) {
            for ($i = 0; $i < count($ingresos_documento_id); $i++) {
                if ($ingresos_existe[$i] == 0) {
                    TcontIngreso::create([
                        'tcont_id' => $tcont->id,
                        'documento_id' => $ingresos_documento_id[$i],
                        'nro' => $ingresos_nro[$i],
                        'monto' => $ingresos_monto[$i]
                    ]);
                } else {
                    $egreso = TcontIngreso::find($ingresos_existe[$i]);
                    $egreso->update([
                        'documento_id' => $ingresos_documento_id[$i],
                        'nro' => $ingresos_nro[$i],
                        'monto' => $ingresos_monto[$i]
                    ]);
                }
            }
        }

        return response()->JSON([
            'sw' => true,
            'tcont' => $tcont,
            'msj' => 'El registro se actualizó de forma correcta'
        ], 200);
    }

    public function show(Tcont $tcont)
    {
        return response()->JSON([
            'sw' => true,
            'tcont' => $tcont
        ], 200);
    }

    public function destroy(Tcont $tcont)
    {
        DB::delete("DELETE FROM tcont_egresos WHERE tcont_id=$tcont->id");
        DB::delete("DELETE FROM tcont_ingresos WHERE tcont_id=$tcont->id");
        $tcont->delete();
        return response()->JSON([
            'sw' => true,
            'msj' => 'El registro se eliminó correctamente'
        ], 200);
    }

    public function destroy_ei(Request $request)
    {
        $tipo = $request->tipo;
        $tcont = null;
        if ($tipo == 'ingreso') {
            $tcont_ingreso = TcontIngreso::find($request->id);
            $tcont = $tcont_ingreso->tcont;
            $tcont_ingreso->delete();
        } else {
            $tcont_egreso = TcontEgreso::find($request->id);
            $tcont = $tcont_egreso->tcont;
            $tcont_egreso->delete();
        }
        $total_egresos = 0;
        $total_ingresos = 0;
        foreach ($tcont->tcont_egresos as $e) {
            $total_egresos += (float)$e->monto;
        }
        foreach ($tcont->tcont_ingresos as $i) {
            $total_ingresos += (float)$i->monto;
        }

        $tcont->total_egresos = $total_egresos;
        $tcont->total_ingresos = $total_ingresos;
        $tcont->profit = (float)$tcont->total_ingresos - (float)$tcont->total_egresos;
        $tcont->save();
        return response()->JSON($tcont);
    }

    public function pdf(Tcont $tcont)
    {
        $pdf = PDF::loadView('reportes.tcont', compact('tcont'))->setPaper('legal', 'portrait');
        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 10, array(0, 0, 0));

        return $pdf->download('Tcont.pdf');
    }
}

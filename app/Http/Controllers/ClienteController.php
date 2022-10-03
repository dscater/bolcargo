<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use App\Models\ClienteEgreso;
use App\Models\ClienteIngreso;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use PDF;

class ClienteController extends Controller
{
    public $validacion = [
        'file_nro' => 'required',
        'tipo_embarque_id' => 'required',
        'venta' => 'required',
        'oficina_id' => 'required',
        'cliente' => 'required',
        'cnee' => 'required',
        'contacto' => 'required',
        'dir' => 'required',
        'ciudad' => 'required',
        'fono' => 'required',
        'fax' => 'required',
        'nro_nit' => 'required',
        'master' => 'required',
        'house' => 'required',
        'documentos_cp' => 'required',
        'hbl_ai_cnee_fletado' => 'required',
        'flete_menor' => 'required',
        'cuanto' => 'required',
        'puerto_embarque' => 'required',
        'puerto_destino_id' => 'required',
        'destino_final_id' => 'required',
        'etd' => 'required|date',
        'eta' => 'required|date',
        'nro_total1' => 'required',
        'units_id1' => 'required',
        'nro_total2' => 'required',
        'units_id2' => 'required',
        'socio_proveedor_id' => 'required',
        'embarcado_id' => 'required',
        'flete_master' => 'required',
        'flete_house' => 'required',
        'notas' => 'required|min:4',
        'total_ingresos' => 'required',
        'total_egresos' => 'required',
        'profit' => 'required',

        'egresos_desc.*' => 'required|min:4',
        'egresos_monto.*' => 'required|numeric|min:1',
        'ingresos_desc.*' => 'required|min:4',
        'ingresos_monto.*' => 'required|numeric|min:1',
    ];

    public $messages = [
        'egresos_desc.*.required' => 'Este campo es obligatorio',
        'egresos_desc.*.min' => 'Debes ingresar al menos :min caracteres',
        'egresos_monto.*.required' => 'Este campo es obligatorio',
        'egresos_monto.*.numeric' => 'Debes ingresar un valor númerico',
        'egresos_monto.*.min' => 'Debes ingresar al menos :min',
        'ingresos_desc.*.required' => 'Este campo es obligatorio',
        'ingresos_desc.*.min' => 'Debes ingresar al menos :min caracteres',
        'ingresos_monto.*.required' => 'Este campo es obligatorio',
        'ingresos_monto.*.numeric' => 'Debes ingresar un valor númerico',
        'ingresos_monto.*.min' => 'Debes ingresar al menos :min',
    ];

    public function index(Request $request)
    {
        $clientes = Cliente::all();
        return response()->JSON(['clientes' => $clientes, 'total' => count($clientes)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->messages);
        $request['fecha_registro'] = date('Y-m-d');
        // CREAR EL CLIENTE
        $cliente = Cliente::create(array_map('mb_strtoupper', $request->except('egresos_desc', 'egresos_monto', 'ingresos_desc', 'ingresos_monto')));

        $egresos_desc = $request->egresos_desc;
        $egresos_monto = $request->egresos_monto;
        if (isset($egresos_desc)) {
            for ($i = 0; $i < count($egresos_desc); $i++) {
                ClienteEgreso::create([
                    'cliente_id' => $cliente->id,
                    'descripcion' => mb_strtoupper($egresos_desc[$i]),
                    'monto' => $egresos_monto[$i]
                ]);
            }
        }
        $ingresos_desc = $request->ingresos_desc;
        $ingresos_monto = $request->ingresos_monto;
        if (isset($ingresos_desc)) {
            for ($i = 0; $i < count($ingresos_desc); $i++) {
                ClienteIngreso::create([
                    'cliente_id' => $cliente->id,
                    'descripcion' => mb_strtoupper($ingresos_desc[$i]),
                    'monto' => $ingresos_monto[$i]
                ]);
            }
        }

        return response()->JSON([
            'sw' => true,
            'cliente' => $cliente,
            'msj' => 'El registro se realizó de forma correcta',
        ], 200);
    }

    public function getCliente(Cliente $cliente)
    {
        return response()->JSON($cliente);
    }

    public function update(Request $request, Cliente $cliente)
    {
        $request->validate($this->validacion, $this->messages);

        $cliente->update(array_map('mb_strtoupper', $request->except('egresos_desc', 'egresos_monto', 'ingresos_desc', 'ingresos_monto', 'egresos_existe', 'ingresos_existe')));

        $egresos_desc = $request->egresos_desc;
        $egresos_monto = $request->egresos_monto;
        $egresos_existe = $request->egresos_existe;
        if (isset($egresos_desc)) {
            for ($i = 0; $i < count($egresos_desc); $i++) {
                if ($egresos_existe[$i] == 0) {
                    ClienteEgreso::create([
                        'cliente_id' => $cliente->id,
                        'descripcion' => mb_strtoupper($egresos_desc[$i]),
                        'monto' => $egresos_monto[$i]
                    ]);
                } else {
                    $cliente_egreso = ClienteEgreso::find($egresos_existe[$i]);
                    $cliente_egreso->update([
                        'descripcion' => mb_strtoupper($egresos_desc[$i]),
                        'monto' => $egresos_monto[$i]
                    ]);
                }
            }
        }
        $ingresos_desc = $request->ingresos_desc;
        $ingresos_monto = $request->ingresos_monto;
        $ingresos_existe = $request->ingresos_existe;
        if (isset($ingresos_desc)) {
            for ($i = 0; $i < count($ingresos_desc); $i++) {
                if ($ingresos_existe[$i] == 0) {
                    ClienteIngreso::create([
                        'cliente_id' => $cliente->id,
                        'descripcion' => mb_strtoupper($ingresos_desc[$i]),
                        'monto' => $ingresos_monto[$i]
                    ]);
                } else {
                    $cliente_ingreso = ClienteIngreso::find($ingresos_existe[$i]);
                    $cliente_ingreso->update([
                        'descripcion' => mb_strtoupper($ingresos_desc[$i]),
                        'monto' => $ingresos_monto[$i]
                    ]);
                }
            }
        }

        return response()->JSON([
            'sw' => true,
            'cliente' => $cliente,
            'msj' => 'El registro se actualizó de forma correcta'
        ], 200);
    }

    public function show(Cliente $cliente)
    {
        return response()->JSON([
            'sw' => true,
            'cliente' => $cliente
        ], 200);
    }

    public function destroy(Cliente $cliente)
    {
        DB::delete("DELETE FROM cliente_egresos WHERE cliente_id=$cliente->id");
        DB::delete("DELETE FROM cliente_ingresos WHERE cliente_id=$cliente->id");
        $cliente->delete();
        return response()->JSON([
            'sw' => true,
            'msj' => 'El registro se eliminó correctamente'
        ], 200);
    }

    public function destroy_ei(Request $request)
    {
        $tipo = $request->tipo;
        $cliente = null;
        if ($tipo == 'ingreso') {
            $cliente_ingreso = ClienteIngreso::find($request->id);
            $cliente = $cliente_ingreso->cliente;
            $cliente_ingreso->delete();
        } else {
            $cliente_egreso = ClienteEgreso::find($request->id);
            $cliente = $cliente_egreso->cliente;
            $cliente_egreso->delete();
        }
        $total_egresos = 0;
        $total_ingresos = 0;
        foreach ($cliente->cliente_egresos as $e) {
            $total_egresos += (float)$e->monto;
        }
        foreach ($cliente->cliente_ingresos as $i) {
            $total_ingresos += (float)$i->monto;
        }

        $cliente->total_egresos = $total_egresos;
        $cliente->total_ingresos = $total_ingresos;
        $cliente->profit = (float)$cliente->total_ingresos - (float)$cliente->total_egresos;
        $cliente->save();
        return response()->JSON($cliente);
    }

    public function pdf(Cliente $cliente)
    {
        $pdf = PDF::loadView('reportes.cliente', compact('cliente'))->setPaper('legal', 'portrait');
        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 10, array(0, 0, 0));

        return $pdf->download('Cliente.pdf');
    }
}

<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use App\Models\Tcont;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public $validacion = [
        'nombre' => 'required|min:4',
        'paterno' => 'required|min:4',
        'ci' => 'required|numeric|digits_between:4, 20|unique:users,ci',
        'ci_exp' => 'required',
        'dir' => 'required|min:4',
        'cel' => 'required|min:4',
        'fono' => 'required|min:4',
        'tipo' => 'required',
    ];

    public $mensajes = [
        'nombre.required' => 'Este campo es obligatorio',
        'nombre.min' => 'Debes ingressar al menos 4 carácteres',
        'paterno.required' => 'Este campo es obligatorio',
        'paterno.min' => 'Debes ingresar al menos 4 carácteres',
        'ci.required' => 'Este campo es obligatorio',
        'ci.numeric' => 'Debes ingresar un valor númerico',
        'ci.unique' => 'Este número de C.I. ya fue registrado',
        'ci_exp.required' => 'Este campo es obligatorio',
        'dir.required' => 'Este campo es obligatorio',
        'dir.min' => 'Debes ingresar al menos 4 carácteres',
        'fono.required' => 'Este campo es obligatorio',
        'fono.min' => 'Debes ingresar al menos 4 carácteres',
        'cel.required' => 'Este campo es obligatorio',
        'cel.min' => 'Debes ingresar al menos 4 carácteres',
        'tipo.required' => 'Este campo es obligatorio',
        'correo' => 'nullable|email|unique:users,correo',
    ];

    public $permisos = [
        'ADMINISTRADOR' => [
            'usuarios.index',
            'usuarios.create',
            'usuarios.edit',
            'usuarios.destroy',

            'clientes.index',
            'clientes.create',
            'clientes.edit',
            'clientes.destroy',

            'manifiestos.index',
            'manifiestos.create',
            'manifiestos.edit',
            'manifiestos.destroy',

            'hbls.index',

            'nota_cobranzas.index',
            'nota_cobranzas.create',
            'nota_cobranzas.edit',
            'nota_cobranzas.destroy',

            'certificado_collect.index',

            'tconts.index',
            'tconts.create',
            'tconts.edit',
            'tconts.destroy',

            'configuracion.index',
            'configuracion.edit',

            'reportes.usuarios',
            'reportes.clientes',
            'reportes.ingresos_egresos',
        ],
        'AUXILIAR' => [
            'clientes.index',
            'clientes.create',
            'clientes.edit',
            'clientes.destroy',

            'manifiestos.index',
            'manifiestos.create',
            'manifiestos.edit',
            'manifiestos.destroy',

            'hbls.index',

            'nota_cobranzas.index',
            'nota_cobranzas.create',
            'nota_cobranzas.edit',
            'nota_cobranzas.destroy',

            'certificado_collect.index',

            'tconts.index',
            'tconts.create',
            'tconts.edit',
            'tconts.destroy',

            'reportes.clientes',
            'reportes.ingresos_egresos',
        ],
    ];


    public function index(Request $request)
    {
        $usuarios = User::where('id', '!=', 1)->get();
        return response()->JSON(['usuarios' => $usuarios, 'total' => count($usuarios)], 200);
    }

    public function store(Request $request)
    {
        if ($request->hasFile('foto')) {
            $this->validacion['foto'] = 'image|mimes:jpeg,jpg,png|max:2048';
        }

        $request->validate($this->validacion, $this->mensajes);
        $cont = 0;
        do {
            $nombre_usuario = User::getNombreUsuario($request->nombre, $request->paterno);
            if ($cont > 0) {
                $nombre_usuario = $nombre_usuario . $cont;
            }
            $request['usuario'] = $nombre_usuario;
            $cont++;
        } while (User::where('usuario', $nombre_usuario)->get()->first());
        $request['password'] = 'NoNulo';
        $request['fecha_registro'] = date('Y-m-d');
        // CREAR EL USER
        $nuevo_usuario = User::create(array_map('mb_strtoupper', $request->except('foto')));
        $nuevo_usuario->password = Hash::make($request->ci);
        $nuevo_usuario->save();
        $nuevo_usuario->foto = 'default.png';
        if ($request->hasFile('foto')) {
            $file = $request->foto;
            $nom_foto = time() . '_' . $nuevo_usuario->usuario . '.' . $file->getClientOriginalExtension();
            $nuevo_usuario->foto = $nom_foto;
            $file->move(public_path() . '/imgs/users/', $nom_foto);
        }
        $nuevo_usuario->correo = mb_strtolower($nuevo_usuario->correo);
        $nuevo_usuario->save();
        return response()->JSON([
            'sw' => true,
            'usuario' => $nuevo_usuario,
            'msj' => 'El registro se realizó de forma correcta',
        ], 200);
    }

    public function update(Request $request, User $usuario)
    {
        $this->validacion['ci'] = 'required|min:4|numeric|unique:users,ci,' . $usuario->id;
        $this->validacion['correo'] = 'nullable|email|unique:users,correo,' . $usuario->id;
        if ($request->hasFile('foto')) {
            $this->validacion['foto'] = 'image|mimes:jpeg,jpg,png|max:2048';
        }

        $request->validate($this->validacion, $this->mensajes);

        $usuario->update(array_map('mb_strtoupper', $request->except('foto')));
        if ($usuario->correo == "") {
            $usuario->correo = NULL;
        }

        if ($request->hasFile('foto')) {
            $antiguo = $usuario->foto;
            if ($antiguo != 'default.png') {
                \File::delete(public_path() . '/imgs/users/' . $antiguo);
            }
            $file = $request->foto;
            $nom_foto = time() . '_' . $usuario->usuario . '.' . $file->getClientOriginalExtension();
            $usuario->foto = $nom_foto;
            $file->move(public_path() . '/imgs/users/', $nom_foto);
        }
        $usuario->correo = mb_strtolower($usuario->correo);
        $usuario->save();
        return response()->JSON([
            'sw' => true,
            'usuario' => $usuario,
            'msj' => 'El registro se actualizó de forma correcta'
        ], 200);
    }

    public function show(User $usuario)
    {
        return response()->JSON([
            'sw' => true,
            'usuario' => $usuario
        ], 200);
    }

    public function actualizaContrasenia(User $usuario, Request $request)
    {
        $request->validate([
            'password_actual' => ['required', function ($attribute, $value, $fail) use ($usuario, $request) {
                if (!\Hash::check($request->password_actual, $usuario->password)) {
                    return $fail(__('La contraseña no coincide con la actual.'));
                }
            }],
            'password' => 'required|confirmed|min:4',
            'password_confirmation' => 'required|min:4'
        ]);

        $usuario->password = Hash::make($request->password);
        $usuario->save();

        return response()->JSON([
            'sw' => true,
            'msj' => 'La contraseña se actualizó correctamente'
        ], 200);
    }

    public function actualizaFoto(User $usuario, Request $request)
    {
        if ($request->hasFile('foto')) {
            $antiguo = $usuario->foto;
            if ($antiguo != 'default.png') {
                \File::delete(public_path() . '/imgs/users/' . $antiguo);
            }
            $file = $request->foto;
            $nom_foto = time() . '_' . $usuario->usuario . '.' . $file->getClientOriginalExtension();
            $usuario->foto = $nom_foto;
            $file->move(public_path() . '/imgs/users/', $nom_foto);
        }
        $usuario->save();
        return response()->JSON([
            'sw' => true,
            'usuario' => $usuario,
            'msj' => 'Foto actualizada con éxito'
        ], 200);
    }

    public function destroy(User $usuario)
    {
        $antiguo = $usuario->foto;
        if ($antiguo != 'default.png') {
            \File::delete(public_path() . '/imgs/users/' . $antiguo);
        }
        $usuario->delete();
        return response()->JSON([
            'sw' => true,
            'msj' => 'El registro se eliminó correctamente'
        ], 200);
    }

    public function getPermisos(User $usuario)
    {
        $tipo = $usuario->tipo;
        return response()->JSON($this->permisos[$tipo]);
    }

    public function getInfoBox()
    {
        $tipo = Auth::user()->tipo;
        $array_infos = [];
        if (in_array('usuarios.index', $this->permisos[$tipo])) {
            $array_infos[] = [
                'label' => 'Usuarios',
                'cantidad' => count(User::where('id', '!=', 1)->get()),
                'color' => 'bg-info',
                'icon' => 'fas fa-users',
            ];
        }

        if (in_array('clientes.index', $this->permisos[$tipo])) {
            $array_infos[] = [
                'label' => 'Clientes',
                'cantidad' => count(Cliente::all()),
                'color' => 'bg-primary',
                'icon' => 'fas fa-users',
            ];
        }

        $array_infos[] = [
            'label' => 'Ingresos',
            'cantidad' => '$ ' . number_format(Tcont::sum('total_ingresos')),
            'color' => 'bg-success',
            'icon' => 'fa fa-money-bill',
        ];

        $array_infos[] = [
            'label' => 'Egresos',
            'cantidad' => '$ ' . number_format(Tcont::sum('total_egresos')),
            'color' => 'bg-danger',
            'icon' => 'fa fa-money-bill',
        ];

        $array_infos[] = [
            'label' => 'Profit',
            'cantidad' => '$ ' . number_format(Tcont::sum('profit')),
            'color' => 'bg-teal',
            'icon' => 'fa fa-money-bill',
        ];

        return response()->JSON($array_infos);
    }

    public function userActual()
    {
        return response()->JSON(Auth::user());
    }

    public function getEstudiantes()
    {
        return response()->JSON(User::where('tipo', 'ESTUDIANTE')->get());
    }

    public function getDocentes()
    {
        return response()->JSON(User::where('tipo', 'DOCENTE')->get());
    }

    public function getUsuario(User $usuario)
    {
        return response()->JSON($usuario);
    }
}

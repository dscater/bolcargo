<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Configuracion extends Model
{
    use HasFactory;

    protected $fillable = [
        'nombre_sistema', 'alias', 'razon_social', 'nit',
        'ciudad', 'dir', 'fono', 'web', 'actividad_economica', 'correo', 'operation_manager', 'nombre_cheque',
        'logo',
    ];

    protected $appends = ['path_image'];
    public function getPathImageAttribute()
    {
        return asset('imgs/' . $this->logo);
    }
}

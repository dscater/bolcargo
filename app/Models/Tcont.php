<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tcont extends Model
{
    use HasFactory;

    protected $fillable = [
        'cliente_id', 'container_nro', 'container_nro2', 'container_nro3', 'container_nro4',
        'total_ingresos', 'total_egresos', 'profit',
        'fecha_registro',
    ];

    protected $with = ['cliente', 'tcont_egresos', 'tcont_ingresos'];

    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'cliente_id');
    }

    public function tcont_egresos()
    {
        return $this->hasMany(TcontEgreso::class, 'tcont_id');
    }

    public function tcont_ingresos()
    {
        return $this->hasMany(TcontIngreso::class, 'tcont_id');
    }
}

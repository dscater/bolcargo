<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    use HasFactory;

    protected $fillable = [
        'file_nro', 'tipo_embarque_id', 'venta', 'oficina_id', 'cliente', 'cnee', 'contacto', 'dir', 'ciudad',
        'fono', 'fax', 'nro_nit', 'master', 'house', 'documentos_cp', 'hbl_ai_cnee_fletado', 'flete_menor', 'cuanto',
        'puerto_embarque', 'puerto_destino_id', 'destino_final_id', 'etd', 'eta', 'nro_total1', 'units_id1',
        'nro_total2', 'units_id2', 'socio_proveedor_id', 'embarcado_id', 'flete_master', 'flete_house', 'notas',
        'total_ingresos', 'total_egresos', 'profit', 'fecha_registro',
    ];

    protected $with = [
        'tipo_embarque', 'oficina', 'puerto_destino', 'destino_final', 'units1',
        'units2', 'socio_proveedor', 'embarcado', 'cliente_egresos', 'cliente_ingresos'
    ];


    public function tipo_embarque()
    {
        return $this->belongsTo(TipoEmbarque::class, 'tipo_embarque_id');
    }
    public function oficina()
    {
        return $this->belongsTo(Oficina::class, 'oficina_id');
    }

    public function puerto_destino()
    {
        return $this->belongsTo(PuertoDestino::class, 'puerto_destino_id');
    }
    public function destino_final()
    {
        return $this->belongsTo(DestinoFinal::class, 'destino_final_id');
    }
    public function units1()
    {
        return $this->belongsTo(Unit::class, 'units_id1');
    }
    public function units2()
    {
        return $this->belongsTo(Unit::class, 'units_id2');
    }
    public function socio_proveedor()
    {
        return $this->belongsTo(SocioProveedor::class, 'socio_proveedor_id');
    }
    public function embarcado()
    {
        return $this->belongsTo(Embarcado::class, 'embarcado_id');
    }

    public function cliente_egresos()
    {
        return $this->hasMany(ClienteEgreso::class, 'cliente_id');
    }

    public function cliente_ingresos()
    {
        return $this->hasMany(ClienteIngreso::class, 'cliente_id');
    }

    public function manifiesto()
    {
        return $this->hasOne(Manifiesto::class, 'cliente_id');
    }

    public function tconts()
    {
        return $this->hasMany(Tcont::class, 'cliente_id');
    }
}

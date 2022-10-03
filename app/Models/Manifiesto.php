<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Manifiesto extends Model
{
    use HasFactory;

    protected $fillable = [
        'cliente_id', 'shipper_id', 'consignee', 'ocean_vessel', 'voyage_nro',
        'port_discharge', 'date_issue', 'place_issue', 'marcas_numeros', 'descripcion', 'peso',
        'shipper_texto', 'consignee2', 'ocean_vessel2', 'voyage_nro2', 'place_issue2',
        'mbl_hbl', 'marcas_numeros2', 'descripcion2', 'peso2',
        'fecha_registro',
    ];

    protected $with = ["cliente", "shipper"];
    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'cliente_id');
    }

    public function shipper()
    {
        return $this->belongsTo(Shipper::class, 'shipper_id');
    }

    // ATTRIBUTOS
    public function getShipperTextoAttribute($value)
    {
        return  nl2br($value);
    }

    public function getConsigneeAttribute($value)
    {
        return  nl2br($value);
    }

    public function getConsignee2Attribute($value)
    {
        return  nl2br($value);
    }

    public function getMarcasNumerosAttribute($value)
    {
        return  nl2br($value);
    }

    public function getMarcasNumeros2Attribute($value)
    {
        return  nl2br($value);
    }

    public function getDescripcionAttribute($value)
    {
        return  nl2br($value);
    }

    public function getDescripcion2Attribute($value)
    {
        return  nl2br($value);
    }

    public function getMblHblAttribute($value)
    {
        return  nl2br($value);
    }
}

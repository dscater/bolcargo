<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TcontEgreso extends Model
{
    use HasFactory;

    protected $fillable = [
        'tcont_id', 'documento_id', 'nro', 'monto',
    ];
    public function tcont()
    {
        return $this->belongsTo(Tcont::class, 'tcont_id');
    }

    public function documento()
    {
        return $this->belongsTo(Documento::class, 'documento_id');
    }
}

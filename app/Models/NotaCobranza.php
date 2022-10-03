<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NotaCobranza extends Model
{
    use HasFactory;

    protected $fillable  = [
        'cliente_id', 'date', 'ref',
    ];

    protected $with = ["cliente"];

    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'cliente_id');
    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Obligacion extends Model
{
    protected $fillable = [ 'numeral', 'obligacion_deta', 'entregable', 'contrato_id'];
}

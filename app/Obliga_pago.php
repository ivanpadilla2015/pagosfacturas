<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Obliga_pago extends Model
{
    protected $fillable = [ 'numeral', 'obligacion_deta', 'entregable', 'mes_ejecucion', 'pago_id'];
}

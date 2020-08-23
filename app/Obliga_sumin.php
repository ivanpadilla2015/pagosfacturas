<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Obliga_sumin extends Model
{
    protected $fillable = [ 'numeral', 'obligacion_deta', 'entregable', 'mes_ejecucion', 'confirmar', 'inforsumini_id'];
  
}

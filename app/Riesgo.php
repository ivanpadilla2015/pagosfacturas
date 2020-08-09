<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Riesgo extends Model
{
   protected $fillable = [ 'tipo', 'descripcion', 'tratamiento', 'responsable', 'periodicidad', 'contrato_id'];
}

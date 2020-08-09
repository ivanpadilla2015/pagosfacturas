<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Riesgo_pago extends Model
{
   protected $fillable = ['tipo', 'descripcion', 'tratamiento', 'responsable', 'periodicidad', 'pago_id'];
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Riesgos_sumin extends Model
{
    protected $fillable = ['tipo', 'descripcion', 'tratamiento', 'responsable', 'periodicidad', 'inforsumini_id'];
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Datosmaestro extends Model
{
    protected $fillable = ['director', 'cargo_director', 'presupuesto', 'cargo_presupuesto'];
}

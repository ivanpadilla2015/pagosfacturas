<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Proveedor extends Model
{
   protected $fillable = ['nombre', 'nitproveedor', 'digver', 'email', 'telefono', 'direccion', 
                           'reprelegal', 'contacto', 'cuenta', 'tipoper', 'regimensimpli'];
}

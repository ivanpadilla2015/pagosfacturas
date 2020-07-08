<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rubro extends Model
{
    
    public function factura()
    {
       return $this->belongsTo('App\Factura');
    }
  

}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Factura extends Model
{
    
    public function contrato()
    {
       return $this->belongsTo('App\Contrato');
    }

    public function dependencia()
    {
       return $this->belongsTo('App\Dependencia');
    }

}

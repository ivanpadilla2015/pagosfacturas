<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rubroprin extends Model
{
    
    public function rubrocontratos()
    {
        return $this->hasMany('App\Rubrocontrato');
    }

    public function uso_rubros()
    {
        return $this->hasMany('App\Uso_rubro');
    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Uso_rubro extends Model
{
    public function rubroprin()
    {
       return $this->belongsTo('App\Rubroprin');
    }
}

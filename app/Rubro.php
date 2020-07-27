<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rubro extends Model
{
    protected $fillable = [ 'nombrerubro', 'codigo' ];

    
    public function factura()
    {
       return $this->belongsTo('App\Factura');
    }
  

}

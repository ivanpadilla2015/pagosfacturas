<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Factura extends Model
{
    
   protected $fillable = ['numfac', 'fechafac', 'status', 'contrato_id', 'pago_id'];
   
   public function contrato()
    {
       return $this->belongsTo('App\Contrato');
    }

    public function pago()
    {
       return $this->belongsTo('App\Pago');
    }
}

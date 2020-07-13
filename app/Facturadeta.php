<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Facturadeta extends Model
{
    protected $fillable = ['numfac', 'fechafac', 'valorfac', 'status','contrato_id', 'dependencia_id',
                            'rubro_id','pago_id'];

    
    public function contrato()
    {
       return $this->belongsTo('App\Contrato');
    }

    public function dependencia()
    {
       return $this->belongsTo('App\Dependencia');
    }

    public function rubro()
    {
       return $this->belongsTo('App\Rubro');
    }

    public function pago()
    {
       return $this->belongsTo('App\Pago');
    }
}

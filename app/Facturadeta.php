<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Facturadeta extends Model
{
    protected $fillable = ['numfac', 'fechafac', 'valorfac', 'status','contrato_id', 'dependencia_id',
                            'uso_rubro_id','pago_id', 'sum_conse'];

    
    public function contrato()
    {
       return $this->belongsTo('App\Contrato');
    }

    public function dependencia()
    {
       return $this->belongsTo('App\Dependencia');
    }

    public function uso_rubro()
    {
       return $this->belongsTo('App\Uso_rubro');
    }

    public function pago()
    {
       return $this->belongsTo('App\Pago');
    }
}

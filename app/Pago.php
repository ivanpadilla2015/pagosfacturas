<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pago extends Model
{
    protected $fillable = ['fecha_pago', 'total', 'contrato_id', 'user_id', 'pago_corresponde_mes', 'mes_ejecucion',
                           'porcentaje_cumplimiento', 'saldo_viene', 'gran_total', 'consecu_informe', 'fecha_plazoeje',
                           'registroadicion', 'director', 'cargo_director', 'sum_conse'];

    public function contrato()
    {
       return $this->belongsTo('App\Contrato');
    }

    public function user()
    {
       return $this->belongsTo('App\User');
    }

    public function facturadetas()
    {
      return $this->hasMany('App\Facturadeta');
    }

    public function factudetadis()
    {
      return $this->hasMany('App\Factudetadi');
    }

    public function dependencia()
    {
       return $this->belongsTo('App\Dependencia');
    }

    public function rubro()
    {
       return $this->belongsTo('App\Rubro');
    }

    public function obliga_pagos()
    {
      return $this->hasMany('App\Obliga_pago');
    }

    public function riesgo_pagos()
    {
      return $this->hasMany('App\Riesgo_pago');
    }

}

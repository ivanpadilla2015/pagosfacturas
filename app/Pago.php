<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pago extends Model
{
    protected $fillable = ['fecha_pago', 'total', 'contrato_id', 'user_id', 'pago_corresponde_mes', 'mes_ejecucion',
                           'porcentaje_cumplimiento'];

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

    public function dependencia()
    {
       return $this->belongsTo('App\Dependencia');
    }

    public function rubro()
    {
       return $this->belongsTo('App\Rubro');
    }

}

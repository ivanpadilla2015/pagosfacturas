<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Inforsumini extends Model
{
    protected $fillable = ['sum_conse', 'saldo_viene','total_info','gran_total','porcentaje_cumplimiento','mes_ejecucion',
                        'corresponde_periodo', 'fechainfo', 'contrato_id','director','cargo_director'];
                       
    public function informeadis()
    {
      return $this->hasMany('App\Informeadi');
    }

    public function contrato()
    {
       return $this->belongsTo('App\Contrato');
    }
      
    public function obliga_sumins()
    {
      return $this->hasMany('App\Obliga_sumin');
    }

    public function riesgos_sumins()
    {
      return $this->hasMany('App\Riesgos_sumin');
    }

}

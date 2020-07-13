<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pago extends Model
{
    protected $fillable = ['fecha_pago', 'total', 'contrato_id', 'user_id'];

    public function contrato()
    {
       return $this->belongsTo('App\Contrato');
    }

    public function user()
    {
       return $this->belongsTo('App\User');
    }

}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Adicion extends Model
{
    protected $fillable = ['registroadicion', 'fechaadicion', 'valoradicion', 'contrato_id', 'newplazoejecucion', 'tipo'];
    
    public function contrato()
    {
       return $this->belongsTo('App\Contrato');
    }
}

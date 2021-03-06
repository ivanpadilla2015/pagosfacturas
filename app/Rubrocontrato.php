<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rubrocontrato extends Model
{
    protected $fillable = [ 'contrato_id', 'rubroprin_id', 'valorrubro', 'saldo' ];

    public function rubroprin()
    {
       return $this->belongsTo('App\Rubroprin');
    }

}

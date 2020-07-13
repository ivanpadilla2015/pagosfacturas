<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Contrato extends Model
{
    protected $fillable = ['proveedor_id', 'numcontrato', 'tipocontrato_id', 'dependencia_id', 
           'fechacontrato', 'valorcontrato', 'registro_pres_inic', 'plazoejecucion', 'objetocontrato',
           'interadmi', 'saldo', 'pagos'];


    public function proveedor()
    {
       return $this->belongsTo('App\Proveedor');
    }

    public function facturas()
    {
        return $this->hasMany('App\Factura');
    }

    public function dependencias()
    {
        return $this->hasMany('App\Dependencia');
    }

   
}

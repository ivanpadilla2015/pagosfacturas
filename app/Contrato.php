<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Contrato extends Model
{
    protected $fillable = ['proveedor_id', 'numcontrato', 'tipocontrato_id', 'dependencia_id', 
           'fechacontrato', 'valorcontrato', 'valoradicion', 'registro_pres_inic', 'plazoejecucion', 'objetocontrato',
           'interadmi', 'saldo', 'pagos', 'supervisor', 'num_mes', 'concargo_id', 'gran_total', 'ejecutado'];


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

    public function concargo()
    {
        return $this->belongsTo('App\Concargo');
    }

    public function adicions()
    {
        return $this->hasMany('App\Adicion');
    }

    public function obligacions()
    {
        return $this->hasMany('App\Obligacion');
    }

    public function rubrocontratos()
    {
        return $this->hasMany('App\Rubrocontrato');
    }

}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Factudetadi extends Model
{
    protected $fillable = ['registroadicion', 'fechaadicion', 'valoradicion', 'pago_id'];
}

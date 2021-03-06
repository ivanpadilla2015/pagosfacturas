<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Informeadi extends Model
{
    protected $fillable = ['registroadicion', 'fechaadicion', 'valoradicion', 'inforsumini_id', 'tipo'];


    public function inforsumini()
    {
       return $this->belongsTo('App\Inforsumini');
    }
}

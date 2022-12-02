<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    protected $table = 'sliders';

    protected $fillable = [

        'ar_title','en_title','image','ar_description','en_description','type'
    ];
}

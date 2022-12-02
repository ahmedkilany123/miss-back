<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;

use App\Models\City;
use App\Models\Country;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CountrisApiController extends Controller
{
    public  function countries(){

      $countries=Country::with('cities')->get();
      return response($countries,200);
    }
    public  function get_cities(Request $request){
        $rules=[
            'country_id'=>'required',


        ];

        $validate=Validator::make(request()->all(),$rules);

        if($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }

        else{
            $country=Country::where('id',$request->country_id)->first();
            if(!$country){
                return response(['message'=>'country not found'],422);
            }
            $cities=City::where('country_id',$country->id)->get();
            return response($cities,200);
        }

        }
}

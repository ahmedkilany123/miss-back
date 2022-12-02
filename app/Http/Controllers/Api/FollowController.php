<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Ad;
use App\Models\Follow;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FollowController extends Controller
{
    public function  follow(Request $request){
        $rules = [

            'followed_id' => 'required',
            'follower_id' => 'required',
        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        $followed=User::where('id',$request->followed_id)->first();
        if(!$followed){
            return response(['message' => 'followed  not found' ], 422);
        }
        $follower=User::where('id',$request->follower_id)->first();
        if(!$follower){
            return response(['message' => 'follower  not found' ], 422);
        }
        $fo=Follow::where(['followed_id'=>$request->followed_id,'follower_id'=>$request->follower_id])->first();
        if($fo){
            $fo->delete();
            return response(['message'=>'delete ok'] ,205);
        }else {
            $p = new Follow();
            $p->followed_id = $request->followed_id;
            $p->follower_id = $request->follower_id;
            $p->save();

            return response($p, 200);
        }
    }


}

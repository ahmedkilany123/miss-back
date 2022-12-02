<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use App\Models\Ad;
use App\Models\Like;
use App\Models\Report;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class Site extends Controller
{
    public function postLikeAd($id)
    {
        if(Auth::check()){
            if(Like::where(['user_id' => auth()->user()->id, 'ad_id' => $id])->exists()){
                Like::where(['user_id' => auth()->user()->id, 'ad_id' => $id])->delete();
                return response()->json(['status' => 0]);
            }else{
                $like= new Like();
                $like->user_id= Auth::user()->id;
                $like->ad_id=$id;

                if($like->save()){

                    return response()->json(['status' => 1]);
                }
            }
        }else{
            return 'not auth';
        }/**/
    }
    public function postreportAd($id)
    {
        if(Auth::check()){
            $ad=Ad::where('id',$id)->first();
            if(Report::where(['user_id' => auth()->user()->id, 'reported_id' => $ad->user_id])->exists()){
                Report::where(['user_id' => auth()->user()->id, 'reported_id' => $ad->user_id])->delete();
                return response()->json(['status' => 0]);
            }else{
                $like= new Report();
                $like->user_id= Auth::user()->id;
                $like->reported_id=$ad->user_id;

                if($like->save()){

                    return response()->json(['status' => 1]);
                }
            }
        }else{
            return 'not auth';
        }/**/
    }
}

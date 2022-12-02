<?php

namespace App\Http\Controllers\Api;

use App\Ad;
use App\Category;
use App\City;
use App\Http\Controllers\Controller;
use App\Models\AdImage;
use App\Models\Comment;
use App\Notification;
use App\User;
use DB;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class AdsController extends Controller
{
    public function add_ad(Request $request)
    {
        $rules = [
            'user_id' => 'required',
            'category_id' => 'nullable',
            'country_id' => 'required|numeric',
            'city_id' => 'nullable',
            'ar_title' => 'required',
            'en_title' => 'nullable',
            'ar_des' => 'required',
            'en_des' => 'nullable',
            'longitude' => 'nullable',
            'latitude' => 'nullable',
            'price' => 'nullable',
            'start_at' => 'nullable|numeric',
            'end_at' => 'nullable|numeric',
            'is_special' => 'required|in:0,1,2',

            'image' => 'nullable|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'video' => 'nullable|max:5128',
            'images.*' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048'


        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }

        $user = User::where('id', $request->user_id)->first();
        if ($request->city_id) {
            $city = \App\Models\City::where('id', $request->city_id)->first();
            if (!$city) {
                return response(['message' => 'city  not found in app'], 422);
            }
        }
        if ($request->category_id) {
            $categories = DB::table('categories')->pluck('id')->toArray();
            if (!in_array($request->category_id, $categories)) {
                return response(['message' => 'category  not found '], 422);
            }
        }
        if (!$user) {
            return response(['message' => 'user not found '], 422);
        }
  if ($user->is_block==1) {
            return response(['message' => 'user is block'], 422);
        }


        $ad = new \App\Models\Ad();
        $ad->ar_title = $request->ar_title;
        $ad->country_id = $request->country_id;
        $ad->start_at = $request->start_at;
        $ad->end_at = $request->end_at;
        $ad->en_title = $request->en_title;
        $ad->ar_des = $request->ar_des;
        $ad->en_des = $request->en_des;
        if ($request->latitude) {

            $ad->latitude = $request->latitude;
        } else {
            $ad->latitude = 0;
        }
        if ($request->longitude) {

            $ad->longitude = $request->longitude;
        } else {
            $ad->longitude = 0;
        }
        $ad->category_id = $request->category_id;
        $ad->city_id = $request->city_id;
        $ad->user_id = $request->user_id;
        $ad->price = $request->price;
        $ad->is_special = $request->is_special;
        $ad->is_active = 1;
        $ad->address = $request->address;
        if ($request->image) {
            $image = $request->file('image');
            $imageName = time() . '.' . \request('image')->getClientOriginalExtension();

            $ad->image = 'uploads/ads/' . $imageName;
            $image->move('uploads/ads', $imageName);
        } if ($request->video) {
            $image1 = $request->file('video');
            $imageName1 = time() . '.3' . \request('video')->getClientOriginalName();

            $ad->video = 'uploads/ads/' . $imageName1;
            $image1->move('uploads/ads', $imageName1);
        }

        $goodInsert = $ad->save();

        if ($request->hasFile('images')) {
            if ($request->images) {

                foreach ($request->images as $value) {
                    $image = new AdImage();
                    $file = $value;
                    $path = "uploads/ads";
                    $name = 'uploads/ads/'.rand(1111,9999) . time() .'.'. $file->getClientOriginalExtension();
                    $file->move($path, $name);
                    $image->image = $name;

                    $image->ad_id = $ad->id;
                    $image->save();
                }
            }}
            if ($goodInsert) {

                return response($ad, 200);

            } else {
                return response([
                    'status' => false,
                    'message' => 'update fail',
                ], 500);

            }//update

        }//validation


    ///delete ad
    public function delete_ad(Request $request)
    {
        $rules = [
            'ad_id' => 'required',
            'user_id' => 'required',


        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }


        $ad = \App\Models\Ad::where('id', $request->ad_id)->first();


        if ($ad == null) {
            return response(['message' => 'ad not found '], 422);
        }
        $user = User::where('id', $ad->user_id)->first();
        if ($user == null) {
            return response(['message' => ' ouner not found '], 422);
        }


        $imags = AdImage::where('ad_id', $request->ad_id)->get();
        foreach ($imags as $imag) {
            $Image = public_path("{ $imag->image}"); // get previous image from folder
            if (File::exists($Image)) { // unlink or remove previous image from folder
                unlink($Image);
            }
        }//endforeach

        $ad = \App\Models\Ad::find($request->ad_id);

        $ad->delete();

        return response(['message' => 'deleted ok'], 200);

        {
            return response([
                'status' => false,
                'message' => 'update fail',
            ], 500);

        }//update


    }
    public  function update_ad (Request $request)
    {
        $rules = [
            'ad_id' => 'required',
            'user_id' => 'required',
            'category_id' => 'nullable',
            'city_id' => 'nullable',
            'ar_title' => 'nullable',
            'en_title' => 'nullable',
            'ar_des' => 'nullable',
            'en_des' => 'nullable',
            'longitude' => 'nullable',
            'latitude' => 'nullable',
            'price' => 'nullable',
            'start_at' => 'nullable|numeric',
            'end_at' => 'nullable|numeric',
            'is_special' => 'nullable|in:0,1,2',

            'image' => 'nullable|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'video' => 'nullable|max:5128',
            'images.*' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048'


        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }





        $ad = \App\Models\Ad::where('id', $request->ad_id)->first();


        if ($ad == null) {
            return response(['message' => 'ad not found '], 422);
        }
        $user = User::where('id', $ad->user_id)->first();
        if ($user == null) {
            return response(['message' => ' ouner not found '], 422);
        }


        if ($request->city_id) {
            $city = \App\Models\City::where('id', $request->city_id)->first();
            if (!$city) {
                return response(['message' => 'city  not found in app'], 422);
            }
        }
        if ($request->category_id) {
            $categories = DB::table('categories')->pluck('id')->toArray();
            if (!in_array($request->category_id, $categories)) {
                return response(['message' => 'category  not found '], 422);
            }
        }

        if ($request->images) {
            $imags = AdImage::where('ad_id', $request->ad_id)->get();
            foreach ($imags as $imag) {
                $Image = public_path("{ $imag->image}"); // get previous image from folder
                if (File::exists($Image)) { // unlink or remove previous image from folder
                    unlink($Image);
                }}}

        if ($request->ar_title) {
            $ad->ar_title = $request->ar_title;
        }  if ($request->is_special) {
            $ad->is_special = $request->is_special;
        }
        if ($request->start_at) {
            $ad->start_at = $request->start_at;
        }
        if ($request->end_at) {
            $ad->end_at = $request->end_at;
        }
        if ($request->en_title) {
            $ad->en_title = $request->en_title;
        }
        if ($request->ar_des) {
            $ad->ar_des = $request->ar_des;
        }
        if ($request->en_des) {
            $ad->en_des = $request->en_des;
        }
        if ($request->latitude) {

            $ad->latitude = $request->latitude;
        } else {
            $ad->latitude = 0;
        }
        if ($request->longitude) {

            $ad->longitude = $request->longitude;
        } else {
            $ad->longitude = 0;
        }
        if ($request->category_id) {
            $ad->category_id = $request->category_id;
        }
        if ($request->city_id) {
            $ad->city_id = $request->city_id;
        }
        $ad->user_id = $request->user_id;
        if ($request->price) {
            $ad->price = $request->price;
        }
        $ad->is_active = 1;
        if ($request->address) {
            $ad->address = $request->address;
        }
        if ($request->image) {
            $image = $request->file('image');
            $imageName = time() . '.' . \request('image')->getClientOriginalExtension();

            $ad->image = 'uploads/ads/' . $imageName;
            $image->move('uploads/ads', $imageName);
        }
        if ($request->video) {
            $image1 = $request->file('video');
            $imageName1 = time() . '.3' . \request('video')->getClientOriginalExtension();

            $ad->video = 'uploads/ads/' . $imageName1;
            $image1->move('uploads/ads', $imageName1);
        }
        $goodInsert = $ad->save();

        if ($request->hasFile('images')) {
            if ($request->images) {

                foreach ($request->images as $value) {
                    $image = new AdImage();
                    $file = $value;
                    $path = "uploads/ads";
                    $name = 'uploads/ads/' .rand(1111,9999) .time() .'.'. $file->getClientOriginalName();
                    $file->move($path, $name);
                    $image->image = $name;

                    $image->ad_id = $ad->id;
                    $image->save();
                }
            }}
        if ($goodInsert) {

            return response($ad, 200);

        } else {
            return response([
                'status' => false,
                'message' => 'update fail',
            ], 500);

        }//update

    }//validation

    public  function add_comment (Request $request)
    {
        $rules = [
            'user_id' => 'required',
            'ad_id' => 'required',
            'comment' => 'required',



        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        $user =User::where('id',$request->user_id)->first();
        $ad=\App\Models\Ad::where('id',$request->ad_id)->first();
        if (!$user) {
            return response(['message' => 'user not found '], 422);
        }

        if (!$ad) {
            return response(['message' => 'ad  not found in app'], 422);
        }
        $comment=new Comment();
        $comment->user_id=$request->user_id;
        $comment->ad_id=$request->ad_id;
        $comment->comment=$request->comment;
        $comment->save();
        if($comment){
            return response($comment,200);
        }



        else {
            return response([
                'status' => false,
                'message' => 'update fail',
            ], 500);

        }//update

    }//validation


}

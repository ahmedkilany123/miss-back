<?php

namespace App\Http\Controllers\Api;

use App\City;
use App\Models\Country;
use App\Models\UserImages;
use App\Rate;
use App\User;
use App\Wallet;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\File;

use DB;


class AuthController extends Controller
{

    /*----------------------------Api aamalna Auth-----------------------------------*/



    /*======================= Register ============================*/

    public function register(Request $request,User $user)// Start Register
    {


        $rules=[
            'name'=>'required',
            'password'=>'required',
            'country_id'=>'required',
            'phone' => 'required|numeric|digits_between:1,20|unique:users',
            'phone_code'=>'required|numeric|digits_between:2,5',
            'email' => 'nullable|string|email|max:255|unique:users',
            'is_agree' => 'required|in:1',

        ];

        $validate=Validator::make(request()->all(),$rules,['digits_between'=>'the phone number must be number no + in it']);

        if($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }

          else{
               $country=Country::where('id',$request->country_id)->first();
              if (!$country) {
                  return response(['message' => 'country not found '], 422);
              } else {
              }
              $user->name=$request->name;
            $user->email=$request->email;
            $user->country_id=$request->country_id;
              if ($request->password) {
                  $user->password = bcrypt($request->password);
              }            $user->phone=$request->phone;
              if ($request->longitude) {
                  $user->longitude = $request->longitude;
              }
              if ($request->latitude) {
                  $user->latitude = $request->latitude;
              }
              $user->phone_code=$request->phone_code;


            $user->is_agree=$request->is_agree;
            $user->is_login=1;




            // Check the software register


            $goodInsert=$user->save();



            if($goodInsert){


               $data=User::where('id',$user->id)->first();
                return response(['user'=>$data],200);

            }else{
                return response([
                    'status'=>false,
                    'message'=>'Insert fail',
                ],500);

            }//insert

        }//validation


    }// End Register

    /*=========================End Register============================*/
    public function registerASmall(Request $request,User $user)// Start Register
    {


        $rules=[
            'name'=>'required',
            'password'=>'required',
            'country_id'=>'required',
            'phone' => 'required|numeric|digits_between:1,20|unique:users',
            'phone_code'=>'required|numeric|digits_between:2,5',
            'email' => 'nullable|string|email|max:255|unique:users',
            'is_agree' => 'required|in:1',

        ];

        $validate=Validator::make(request()->all(),$rules,['digits_between'=>'the phone number must be number no + in it']);

        if($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }

          else{
               $country=Country::where('id',$request->country_id)->first();
              if (!$country) {
                  return response(['message' => 'country not found '], 422);
              } else {
              }
              $user->name=$request->name;
            $user->email=$request->email;
            $user->country_id=$request->country_id;
              if ($request->password) {
                  $user->password = bcrypt($request->password);
              }            $user->phone=$request->phone;
              if ($request->longitude) {
                  $user->longitude = $request->longitude;
              }
              if ($request->latitude) {
                  $user->latitude = $request->latitude;
              }
              $user->phone_code=$request->phone_code;


            $user->is_agree=$request->is_agree;
            $user->is_login=1;
            $user->type=2;




            // Check the software register


            $goodInsert=$user->save();



            if($goodInsert){


               $data=User::where('id',$user->id)->first();
                return response(['user'=>$data],200);

            }else{
                return response([
                    'status'=>false,
                    'message'=>'Insert fail',
                ],500);

            }//insert

        }//validation


    }// End Register
    public function add_subSmall(Request $request,User $user)// Start Register
    {


        $rules=[
            'perent_id'=>'required',
            'ar_name'=>'required',
            'en_name'=>'required',
            'phone' => 'required|numeric|digits_between:1,20',
            'email' => 'nullable|string|email|max:255|unique:users',


        ];

        $validate=Validator::make(request()->all(),$rules,['digits_between'=>'the phone number must be number no + in it']);

        if($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }

          else{

              $user->ar_name=$request->ar_name;
              $user->en_name=$request->en_name;
              $user->ar_des=$request->ar_des;
              $user->en_des=$request->en_des;
              $user->perent_id=$request->perent_id;
            $user->email=$request->email;
            $user->country_id=$request->country_id;
              if ($request->password) {
                  $user->password = bcrypt($request->password);
              }            $user->phone=$request->phone;
              if ($request->longitude) {
                  $user->longitude = $request->longitude;
              }
              if ($request->latitude) {
                  $user->latitude = $request->latitude;
              }
              $user->phone_code=$request->phone_code;


            $user->is_agree=1;
            $user->is_login=1;
            $user->type=3;
             if ($user->image != null) {

                    $usersImage = public_path("{$user->image}"); // get previous image from folder
                    if (File::exists($usersImage)) { // unlink or remove previous image from folder
                        unlink($usersImage);
                    }
                }///delete pr avatar
              if ($request->image) {
                  $image = $request->file('image');
                  $imageName = 'uploads/users/' . time() . '.' . request()->image->getClientOriginalExtension();
                  $user->image = $imageName;
                  $image->move('uploads/users/', $imageName);

              }



            // Check the software register


            $goodInsert=$user->save();

              if ($request->hasFile('images')) {
                  if ($request->images) {

                      foreach ($request->images as $value) {
                          $image = new UserImages();
                          $file = $value;
                          $path = "uploads/users";
                          $name = 'uploads/users/' . time() . $file->getClientOriginalName();
                          $file->move($path, $name);
                          $image->image = $name;

                          $image->mall_id = $user->id;
                          $image->save();
                      }
                  }}

            if($goodInsert){


               $data=User::where('id',$user->id)->first();
                return response(['user'=>$data],200);

            }else{
                return response([
                    'status'=>false,
                    'message'=>'Insert fail',
                ],500);

            }//insert

        }//validation


    }// End Register

    /*=========================End Register============================*/


    /*======================= Login ============================*/


    public function login(Request $request){ // Start Login

        $rules = [
            'kayWord' => 'required',

            'password' => 'required',

        ];
        $validate = Validator::make(request()->all(), $rules);
        if ($validate->fails()) {

            return response(['message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {

            if (Auth::attempt(['email' => request('kayWord'), 'password' => request('password')])) {
                $user = Auth::user();

                //  $user->api_token=str_random(60);

                $user->is_login = 1;
                $user->save();

                return response($user, 200);


            }
            if (Auth::attempt(['phone' => request('kayWord'), 'password' => request('password')])) {
                $user = Auth::user();

                //  $user->api_token=str_random(60);

                $user->is_login = 1;
                $user->save();


                return response($user,200);


            }



            return response([
                'messages' => 'Invalid phone or password',

            ], 404);
        }//no login


    }// validation

    public function canRest(Request $request)
    { // Start Login


        $rules = [
            'kayWord' => 'required',


        ];
        $validate = Validator::make(request()->all(), $rules);
        if ($validate->fails()) {

            return response(['message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {
            $user=User::where('email',$request->kayWord)->orWhere('phone',$request->kayWord)->first();
            if($user){
                $is_found=1;
                return response(['can'=>$is_found,'user_id'=>$user->id],200);

            }else{
                $is_found=0;
                return response(['can'=>$is_found,'user_id'=>null],200);


            }
        }


        return response([
            'messages' => 'Invalid phone or password',

        ], 404);



    }// validation

//login end
    /*=======================End Login ============================*/

    /*======================= Logout ============================*/

    public function logout(Request $request)
    {
        $rules=[

            'id'=>'required|numeric',


        ];

        $validate=Validator::make(request()->all(),$rules);

        if($validate->fails()){

            return response(['status'=>false,'message'=>'this is the all errors','errors'=>$validate->messages()],422);

        }else {
            $user = User::where('id', $request->id)->first();
           if($user) {
               $user->is_login = 0;
               return response()->json([
                   'message' => 'Successfully logged out'
               ],200);
           }
           return response()->json([
               'message' => 'user not found'
           ],404);
        }
    }

    /*=======================End Logout ============================*/

    /*----------------------------End Api Emdad Auth-----------------------------------*/


}// Class

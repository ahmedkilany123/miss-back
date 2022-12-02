<?php

namespace App\Http\Controllers\Api;
use App\Category;
use App\City;
use App\Comment;
use App\Follow;
use App\Image;
use App\Models\Ad;
use App\Like;
use App\Models\AdImage;
use App\Models\Offer;
use App\Models\View;
use App\Notification;
use App\Previous;
use App\Profits;
use App\Rate;
use App\Report;
use App\Subcategory;
use App\User;
use App\Wallet;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class ProfilesController extends Controller
{
    public function user_image(Request $request)
    {
        $rules = [
            'user_id' => 'required',
            'image' => 'required|image|mimes:jpeg,jpg,png,gif',
        ];

        $validate = Validator::make(request()->all(), $rules);


        if ($validate->fails()) {

            return response(['message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {
            $user= User::where('id',$request->user_id)->first();
            if(!$user) {
                return response()->json(['user_not_found'], 404);
            }  //check user

            if (!$request->hasFile('image')) {
                return response()->json(['upload_file_not_found'], 404);
            }//ckeck   avatar




                if ($user->image != null) {

                    $usersImage = public_path("{$user->image}"); // get previous image from folder
                    if (File::exists($usersImage)) { // unlink or remove previous image from folder
                        unlink($usersImage);
                    }
                }///delete pr avatar
                $image = $request->file('image');
                $imageName ='uploads/users/'. time() . '.' . request()->image->getClientOriginalExtension();
                $user->image = $imageName;
            $image->move('uploads/users/', $imageName);

            $user->save();

                $save = $user->save();
                if ($save) {



                    return response($user, 200);




            } else {
                return response(['message' => 'Error in update'], 404);

            }// Save


        }///check user
        return response(['message' => 'user not found '], 422);
    }// validate


    //logo or image
//Update Normal Information
    public function user_profile_edit(Request $request)
    {


        $rules = [
            'user_id' => 'required',
            'name' => 'required|',

            'email' => 'nullable|string|email|max:191',

            'phone' => 'nullable|numeric|digits_between:10,20',
            'country_id' => 'required|numeric',



        ];
        $validate = Validator::make(request()->all(), $rules, ['digits_between' => 'the phone number must be number no + in it']);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {
            $users = DB::table('users')->pluck('id')->toArray();
            if (in_array($request->user_id, $users)) {
                $cities = DB::table('countries')->pluck('id')->toArray();
                if (!in_array($request->country_id, $cities)) {
                    return response(['message' => 'country  not found in app'], 422);
                }


                $user = User::find($request->user_id);
                // Check Email Or username Validation

                if ($request->email) {
                    $user_email = User::where('id', '!=', $user->id)->where('email', $request->email)->get();
                    if ($user_email->count() != 0) {
                        return response(['status' => false, 'message' => 'The email is already taken'], 422);

                    }
                }

                if ($request->phone) {
                    $user_mobile = User::where('id', '!=', $user->id)->where('phone', $request->phone)->get();
                    if ($user_mobile->count() != 0) {
                        return response(['status' => false, 'message' => 'The mobile is already taken'], 422);

                    }
                }

                $user->name = $request->name;
                if ($request->email) {
                    $user->email = $request->email;
                }
                if ($request->phone) {
                    $user->phone = $request->phone;
                } if ($request->phone_code) {
                    $user->phone_code = $request->phone_code;
                }
                if ($request->address) {
                    $user->address = $request->address;
                }
                if ($request->password) {
                    $user->password = bcrypt($request->password);
                }
                if ($request->latitude) {
                    $user->latitude = $request->latitude;
                }
                if ($request->longitude) {
                    $user->longitude = $request->longitude;
                }

                $user->country_id = $request->country_id;

                //save
                $goodInsert = $user->save();
                if ($goodInsert) {


                        return response($user, 200);
                    }



            } else {
                    return response([
                        'status' => false,
                        'message' => 'update fail',
                    ], 500);



            }//validation
        }//check user
        return response(['message' => 'user not found '], 422);
    }//normal data update

    public function user_password_edit(Request $request)
    {


        $rules = [
            'id' => 'required',

            'password' => 'required|string|min:6',


        ];
        $users = DB::table('users')->pluck('id')->toArray();
        if (in_array($request->id, $users)) {
            $validate = Validator::make(request()->all(), $rules, ['digits_between' => 'the phone number must be number no + in it']);

            if ($validate->fails()) {

                return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

            } else {
                $postivesRate = Rate::where('rated_id', $request->id)->where('liked', 1)->count();

                $negativeRate = Rate::where('rated_id', $request->id)->where('liked', 0)->count();
                $user = User::find($request->id);
                // Check Email Or username Validation


                $user->password = $request->password != null ?bcrypt($request->password):$user->password ;

                $user->last_Sing_in_at=Carbon::now();
                $user->current_Sing_in_at=Carbon::now();
                //save
                $goodInsert = $user->save();
                if ($goodInsert) {

                    $city = City::where('id', $user->city_id)->first();
                    $user["city_name"] = $city->name;
                    $wallat = Wallet::where('user_id', $user->id)->first();
                    if ($wallat) {
                        $user["total"] = $wallat->total;
                        $user['Evaluation'] = $wallat->Evaluation;
                        $user['negativeRate'] = $negativeRate;
                        $user['postivesRate'] = $postivesRate;
                        return response(['user' => $user], 200);
                    }
                    $user["total"] = 0;
                    $user['Evaluation'] = 0;
                    $user['negativeRate'] = $negativeRate;
                    $user['postivesRate'] = $postivesRate;
                    return response(['user' => $user], 200);


            } else {
                    return response([
                        'status' => false,
                        'message' => 'update fail',
                    ], 500);

                }//update

            }//validation
        }//check user
        return response(['message' => 'user not found '], 422);
    }//normal data update

////////user ads============================
    public function my_ad(Request $request)
    {
        $rules = [
            'user_id' => 'required',

        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {
            $user = User::where('id', $request->user_id)->first();
            if ($user == null) {
                return response(['message' => 'user not found '], 422);
            }
            $pre=Previous::where('follower_id', $request->user_id)->pluck('user_id')->toArray();
            $fo=Follow::where('follower_id', $request->user_id)->pluck('followed_id')->toArray();

            $ads = Ad::whereIn('user_id',$pre)->orWhereIn('user_id',$fo)->where('ads_type',2)->orderBy('id','desc')->paginate(10);
            $i = 0;
            foreach ($ads as $ad) {
                $countComments=Comment::where('ad_id',$ad->id)->count();
                $image = Image::where('ad_id', $ad->id)->first();
                $city = City::where('id', $ad->city_id)->first();
                $cat = Category::where('id', $ad->category_id)->first();
                $scat = Subcategory::where('id', $ad->subcategory_id)->first();

                if ($image) {
                    $ads[$i]['image'] = $image->image;
                } else {
                    $ads[$i]['image'] = null;

                }
                $ads[$i]['city_name'] = $city->name;
                $ads[$i]['category_name'] = $cat->name;
                $ads[$i]['sub_category_name'] = $scat->name;
                $ads[$i]['councomments']=$countComments;
                $i++;
            }
            return response($ads, 200);

        }

    }

    public function single_ad(Request $request)
    {
        $rules = [
            'ad_id' => 'required', 'user_id' => 'nullable',

        ];
        $validate = Validator::make(request()->all(), $rules, ['digits_between' => 'the phone number must be number no + in it']);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {
            $ad = Ad::where('id', $request->ad_id)->with('images')->first();
            if (!$ad) {
                return response(['message' => 'ad not found '], 422);
            }
            $view= new View();
            $view->ad_id=$ad->id;
            if ($request->user_id) {
                $view->ad_id = $request->user_id;
            }
            $view->save();
            $like=\App\Models\Like::where(['ad_id'=>$request->ad_id,'user_id'=>$request->user_id])->first();
            $l=\App\Models\Like::where(['ad_id'=>$request->ad_id])->count();
            $v=\App\Models\View::where(['ad_id'=>$request->ad_id])->count();
            $follow=\App\Models\Follow::where(['followed_id'=>$ad->user_id,'follower_id'=>$request->user_id])->first();
            $category = \App\Models\Category::where('id', $ad->category_id)->first();
            $user=User::where('id',$ad->user_id)->first();
            if ($category) {
                $ad['category_ar_title'] = $category->ar_title;
                $ad['category_en_title'] = $category->en_title;
            } else {
                $ad['category_ar_title'] = null;
                $ad['category_en_title'] = null;
            }
            if ($user) {
                $ad['user_name'] = $user->name;
                $ad['user_phone'] = $user->phone;
            } else {
                $ad['user_name'] = null;
                $ad['user_phone'] = null;

            }
            $ad['like_count'] = $l;
            $ad['view_count'] = $v;

            if($like){ $ad['like_ad']=1;}else{ $ad['like_ad']=0;}
            if($follow){ $ad['is_follow']=1;}else{ $ad['is_follow']=0;}


            $comments = \App\Models\Comment::where('ad_id', $ad->id)->get();
            $t = 0;
            foreach ($comments as $comment) {
                $user = User::where('id', $comment->user_id)->first();
                $comments[$t]['user_name'] = $user->name;
                $comments[$t]['user_image'] = $user->avatar;
                $comments[$t]['date'] = strtotime($comment->created_at);
                $t++;
            }
            $ad['comments'] = $comments;

            return response($ad, 200);
        }

    }
    public function single_acution(Request $request)
    {
        $rules = [
            'ad_id' => 'required', 'user_id' => 'nullable',

        ];
        $validate = Validator::make(request()->all(), $rules, ['digits_between' => 'the phone number must be number no + in it']);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {
            $ad = Ad::where('id', $request->ad_id)->with('images')->first();
            if (!$ad) {
                return response(['message' => 'ad not found '], 422);
            }
            $view= new View();
            $view->ad_id=$ad->id;
            if ($request->user_id) {
                $view->ad_id = $request->user_id;
            }
            $view->save();
            $like=\App\Models\Like::where(['ad_id'=>$request->ad_id,'user_id'=>$request->user_id])->first();
            $l=\App\Models\Like::where(['ad_id'=>$request->ad_id])->count();
            $v=\App\Models\View::where(['ad_id'=>$request->ad_id])->count();
            $follow=\App\Models\Follow::where(['followed_id'=>$ad->user_id,'follower_id'=>$request->user_id])->first();
            $category = \App\Models\Category::where('id', $ad->category_id)->first();
            $user=User::where('id',$ad->user_id)->first();
            if ($category) {
                $ad['category_ar_title'] = $category->ar_title;
                $ad['category_en_title'] = $category->en_title;
            } else {
                $ad['category_ar_title'] = null;
                $ad['category_en_title'] = null;
            }
            if ($user) {
                $ad['user_name'] = $user->name;
                $ad['user_phone'] = $user->phone;
            } else {
                $ad['user_name'] = null;
                $ad['user_phone'] = null;


            }
            $ad['like_count'] = $l;
            $ad['view_count'] = $v;

            if($like){ $ad['like_ad']=1;}else{ $ad['like_ad']=0;}
            if($follow){ $ad['is_follow']=1;}else{ $ad['is_follow']=0;}


            $comments = \App\Models\Comment::where('ad_id', $ad->id)->get();
            $t = 0;
            foreach ($comments as $comment) {
                $user = User::where('id', $comment->user_id)->first();
                $comments[$t]['user_name'] = $user->name;
                $comments[$t]['user_image'] = $user->image;
                $comments[$t]['date'] = strtotime($comment->created_at);
                $t++;
            }
            $ad['comments'] = $comments;
 $offers = Offer::where('ad_id', $ad->id)->get();
            $t = 0;
            foreach ($offers as $comment) {
                $user = User::where('id', $comment->user_id)->first();
                $offers[$t]['user_name'] = $user->name;
                $offers[$t]['user_image'] = $user->image;
                $offers[$t]['date'] = strtotime($comment->created_at);
                $t++;
            }
            $hoffer=Offer::where('ad_id',$ad->id)->orderBy('price','asc')->first();

            if ($hoffer) {
                $huser = User::where('id', $hoffer->user_id)->first();
                if ($huser) {
                    $hightoffer['user_name'] = $huser->name;
                    $hightoffer['user_image'] = $huser->image;
                    $hightoffer['user_price'] = $hoffer->price;
                } else {
                    $hightoffer['user_name'] = null;
                    $hightoffer['user_image'] = null;
                    $hightoffer['user_price'] = null;
                }
            } else {
                $hightoffer['user_name'] = null;
                $hightoffer['user_image'] = null;
                $hightoffer['user_price'] = null;
            }


            $ad['offers'] = $offers;
            $ad['hioffer'] = $hightoffer;

            return response($ad, 200);
        }

    }
    /*========================End User profile=========================*/
    /*================== ============= =============================*/
    public function user_rate(Request $request)
    {
        $rules = [
            'user_id' => 'required|numeric',
            'rated_id' => 'required|numeric',

            'liked' => 'required|numeric|in:0,1',
            'reason' => 'required',

        ];

        $validate = Validator::make(request()->all(), $rules);


        if ($validate->fails()) {

            return response(['message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {


            $user = User::where('id', $request->user_id)->first();
            $rated = User::where('id', $request->rated_id)->first();
            $ad = Ad::where('id', $request->ad_id)->first();
            $rat = Rate::where('user_id', $request->user_id)
                ->where('rated_id', $request->rated_id)
                ->first();

            if ($user == null) {
                return response(['message' => 'user not found '], 422);
            }///// end user not found
            if ($rated == null) {
                return response(['message' => 'user you want to rated  not found '], 422);
            }///// end rated not found

            if ($rat) {
                return response(['message' => 'ad you want to rated   you rate it before '], 422);
            }///// end ad not found

            $r = New Rate();
            $r->user_id = $request->user_id;

            $r->liked = $request->liked;
            $r->rated_id = $request->rated_id;
            $r->reason = $request->reason;
            $r->save();
            $profits=Profits::where('user_id',$r->rated_id)->first();
            if($profits){
                $profits->rate_price+=0.1;
                $profits->total_price+=0.1;
                $profits->save();
            }else{
                $profits=new Profits();
                $profits->user_id=$r->rated_id;
                $profits->rate_price=0.1;
                $profits->total_price=0.1;
                $profits->save();
            }
            $notification = new Notification();

            $notification->user_id = $r->rated_id;
            $notification->note =   'تم اضافة الاعلان  واضافة  الربح0.1نقطة الي محفظتك ';
            $notification->type=1;
            $notification->save();
            return response($r, 200);

        }//logo or image

    }

//////////show profile
  public function my_account(Request $request)
    {
        $rules = [
            'register_id' => 'nullable',
            'user_id' => 'required',

        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {
            $user = User::where('id', $request->user_id)->first();
            $fo=\App\Models\Follow::where('followed_id', $request->user_id)->pluck('follower_id')->toArray();
            $follows=\App\Models\Follow::where('followed_id', $request->user_id)->count();
            $reports=\App\Models\Report::where('user_id',$request->user_id)->pluck('reported_id')->toArray();
            $ads = \App\Models\Ad::orWhereIn('user_id',$fo)->get();
            if ($user == null) {
                return response(['message' => 'user not found '], 422);
            }

            if ($request->register_id &&$request->register_id!=$request->user_id) {
                if (in_array( $request->register_id,$fo)) {
                $user["is_follow"] = 1;
            }else {
                    $user["is_follow"] = 0;

                }  if (in_array( $request->register_id,$reports)) {
                $user["is_report"] = 1;
            }else {
                    $user["is_report"] = 0;

                }
            } else{
                    $user["is_follow"] = 0;
                $user["is_report"] = 0;


            }

            $ads=Ad::where('user_id',$user->id)->get();
            $j=0;
            foreach ($ads as $ad){

                $image=AdImage::where('ad_id',$ad->id)->first();
                $views=View::where('ad_id',$ad->id)->count();
                $cat=\App\Models\Category::where('id',$ad->category_id)->first();
                if($image){
                $ads[$j]['ad_image']=$image->image;
            }else{   $ads[$j]['ad_image']='not found';    }

                if ($cat) {
                    $ads[$j]['ad_category_ar_title'] = $cat->ar_title;
                    $ads[$j]['ad_category_en_title'] = $cat->en_title;
                } else {
                    $ads[$j]['ad_category_ar_title'] =null;
                    $ads[$j]['ad_category_en_title'] = null;
                }
                $ads[$j]['ad_view_count'] = $views;

                $j++;
            }

            return response(['user' => $user,

                'follows' => $follows,
                'ads' => $ads,
            ], 200);
        }

    }



}


<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Ad;
use App\Models\Category;
use App\Models\Offer;
use App\Models\Slider;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class CategoriesContereller extends Controller
{

    public function store(Request $request)
    {
        $rules= [
            'ar_title' => 'required',
            'en_title' => 'required',
            'image' => 'nullable|image|mimes:jpeg,jpg,png,gif',
        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }

        $c = new Category();

        $c->ar_title = $request->ar_title;
        $c->en_title = $request->en_title;
        if ($request->parent_id) {
            $cc = \App\Models\Category::where('id', $request->parent_id)->first();
            if (!$cc) {
                return response(422);
            }
            $c->parent_id = $request->parent_id;
            $c->level += $cc->level + 1;
        }


        if ($request->image) {


            $image = $request->file('image');
            $imageName = time() . '.' . \request('image')->getClientOriginalExtension();
            $c->image = 'uploads/categories/' . $imageName;
            $image->move('uploads/categories', $imageName);
        }

        $c->save();
        return response($c,200);

    }  public function sliders(Request $request)
    {
        $rules= [

            'image' => 'required|image|mimes:jpeg,jpg,png,gif',
        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }

        $c = new Slider();



        if ($request->image) {


            $image = $request->file('image');
            $imageName = time() . '.' . \request('image')->getClientOriginalExtension();
            $c->image = 'uploads/sliders/' . $imageName;
            $image->move('uploads/sliders', $imageName);
        }

        $c->save();
        return response($c,200);

    }
    public function filter_by_cat (Request $request){
        $rules = [
            'category_id' => 'required',

        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }

        $cat = Category::where('id', $request->category_id)->first();
        if (!$cat) {
            return response(['message' => 'category not found '], 422);
        }
        $aaa=Ad::where('category_id',$cat->id)->where('is_special','!=',2)->pluck('user_id')->toArray();
        $ads=Ad::where('category_id',$cat->id)->whereIn('user_id',$aaa)->get();
        $i = 0;
        foreach ($ads as $ad) {
            $cat = Category::where('id', $ad->category_id)->first();
            $user = User::where('id', $ad->user_id)->first();
if($user){
    $ads[$i]['user_name'] = $user->name;

}else{
    $ads[$i]['user_name'] = null;

}

            if ($cat) {
                $ads[$i]['category_ar_title'] = $cat->ar_title;
                $ads[$i]['category_en_title'] = $cat->en_title;
            } else {
                $ads[$i]['category_ar_title'] =null;
                $ads[$i]['category_en_title'] = null;
            }
            $i++;
        }
        return response($ads,200);
    }
    public function get_aucations (Request $request){
        $rules=[

            'country_id'=>'nullable|numeric',


        ];

        $validate=Validator::make(request()->all(),$rules,['digits_between'=>'the phone number must be number no + in it']);

        if($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        if($request->country_id){
            $aaa=Ad::where('category_id',null)->pluck('user_id')->toArray();

            $ads=Ad::where('category_id',null)->where('is_special',2)->where('country_id',$request->country_id)->whereIn('user_id',$aaa)->get();
            $i = 0;
            foreach ($ads as $ad) {
                $v=\App\Models\View::where(['ad_id'=>$ad->id])->count();
                $hoffer=Offer::where('ad_id',$ad->id)->orderBy('price','asc')->first();

                $user = User::where('id', $ad->user_id)->first();
                if($user){
                    $ads[$i]['user_name'] = $user->name;

                }else{
                    $ads[$i]['user_name'] = null;

                }


                $ads[$i]['category_ar_title'] =null;
                $ads[$i]['category_en_title'] = null;
                $ads[$i]['view_count'] = $v;
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


                $ads[$i]['hioffer']=$hightoffer;
                $i++;
            }
            return response($ads,200);
        }else{
            $aaa=Ad::where('category_id',null)->pluck('user_id')->toArray();

            $ads=Ad::where('category_id',null)->where('is_special',2)->whereIn('user_id',$aaa)->get();
            $i = 0;
            foreach ($ads as $ad) {
                $v=\App\Models\View::where(['ad_id'=>$ad->id])->count();
                $hoffer=Offer::where('ad_id',$ad->id)->orderBy('price','asc')->first();

                $user = User::where('id', $ad->user_id)->first();
                if($user){
                    $ads[$i]['user_name'] = $user->name;

                }else{
                    $ads[$i]['user_name'] = null;

                }


                $ads[$i]['category_ar_title'] =null;
                $ads[$i]['category_en_title'] = null;
                $ads[$i]['view_count'] = $v;
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


                $ads[$i]['hioffer']=$hightoffer;
                $i++;
            }
            return response($ads,200);
        }

    }
    public function search(Request $request)
    {
        $rules = [
            'key_word' => 'required',
            'country_id'=>'nullable|numeric',


        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {
            /*  $categories= Category::all();
              $subcategories = Subcategory::all();*/
             if($request->country_id){  $keyword = $request['key_word'];
                 $ads = Ad::where('ar_title', 'like', '%' . $keyword . '%')->orWhere('price', 'like', '%' . $keyword . '%')->orWhere('en_title', 'like', '%' . $keyword . '%')->where('country_id',$request->country_id)->orderBy('id', 'desc')->get();
                 $i = 0;
                 foreach ($ads as $ad) {
                     $cat = Category::where('id', $ad->category_id)->first();


                     if ($cat) {
                         $ads[$i]['category_ar_title'] = $cat->ar_title;
                         $ads[$i]['category_en_title'] = $cat->en_title;
                     } else {
                         $ads[$i]['category_ar_title'] =null;
                         $ads[$i]['category_en_title'] = null;
                     }
                     $i++;
                 }
                 return response( $ads, 200);}else{  $keyword = $request['key_word'];
                 $ads = Ad::where('ar_title', 'like', '%' . $keyword . '%')->orWhere('price', 'like', '%' . $keyword . '%')->orWhere('en_title', 'like', '%' . $keyword . '%')->orderBy('id', 'desc')->get();
                 $i = 0;
                 foreach ($ads as $ad) {
                     $cat = Category::where('id', $ad->category_id)->first();


                     if ($cat) {
                         $ads[$i]['category_ar_title'] = $cat->ar_title;
                         $ads[$i]['category_en_title'] = $cat->en_title;
                     } else {
                         $ads[$i]['category_ar_title'] =null;
                         $ads[$i]['category_en_title'] = null;
                     }
                     $i++;
                 }
                 return response( $ads, 200);}

        }
    }
    public function get_all_categories(Request $request)
    {

        //check lang

        //get data
        $cats =Category::where('level',0)->with('categories')->get();
        //foreach in  categories

        return response($cats, 200);
    }//end
}

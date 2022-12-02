<?php

namespace App\Http\Controllers\Api;



use App\Models\Ad;
use App\Models\Admin;
use App\Models\Brand;
use App\Models\Category;
use App\Models\City;
use App\Models\Company;

use App\Models\Contact;
use App\Models\Country;
use App\Models\Document;
use App\Models\Follow;
use App\Models\Jewellery;
use App\Models\JewelleryOrder;
use App\Models\JewelleryWallet;
use App\Models\Like;
use App\Models\NewsTicker;
use App\Models\Notification;
use App\Models\Offer;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use App\Models\Report;
use App\Models\UserMessage;
use App\Models\View;
use App\Payment;
use App\Qualification;
use App\HandGraduation;
use App\EmailType;
use App\Models\Bank;

use App\Models\Rate;
use App\ServicePrice;
use App\Models\SiteText;
use App\Models\Skill;
use App\Models\Slider;
use App\User;
use Carbon\Carbon;
use DB;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Pagination\LengthAwarePaginator;

class HelperController extends Controller
{
    /*=========================== contact_us ============================*/

    public function contact_us(Request $request)
    {

        $rules = [
            'name' => 'required|string',
            'email' => 'required|string|email|max:255',
            'subject' => 'nullable|string|max:190',
            'message' => 'required|string|max:2000',
        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {

            $contact = new \App\Models\Contact();
            $contact->name = $request->name;
            $contact->email = $request->email;
            $contact->subject = $request->subject;
            $contact->message = $request->input('message');


            $save = $contact->save();

            if ($save) {

                // Send To admin


                return response($contact, 200);

            } else {
                return response([
                    'status' => false,
                    'message' => 'Insert fail',
                ], 404);

            }//insert


        }//validate


    }//end fun
    ////add balance

    /*=========================== get alll info for user  ============================*/


    public function toggel_report(Request $request)
    {

        $rules = [
            'user_id' => 'required',
            'reported_id' => 'required',

        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {
            $follower = Report::where(['user_id' => $request->user_id, 'reported_id' => $request->reported_id])->first();
            if ($follower) {
              $follower->delete();
                return response(['message' => 'report deleted'], 200);
            }
            $r=new  Report();
            $r->user_id=$request->user_id;
            $r->reported_id=$request->reported_id;
            $r->save();

            return response($r, 200);

        }//validate


    }//end fun
    public function get_representatives(Request $request)
    {

        $rules = [
            'country_id' => 'required',

        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {
            $country = Country::where(['id' => $request->country_id])->first();
            if (!$country) {
                return response(['message' => 'country not found'], 422);
            }
            $r=User::where(['country_id'=>$request->country_id,'type'=>5,'is_block'=>0])->get();

            return response($r, 200);

        }//validate


    }//end fun
    public function news(){
        $news=Ad::orderBy('id','desc')->take(20)->get();
        return response($news,200);
    } public function messages(){
        $news=UserMessage::where('is_block',0)->get();
        return response($news,200);
    }

    public function changepr(Request $request)
    {
        $rules = [
            'user_id' => 'required',


        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {
            $user = User::where('id', $request->user_id)->first();
            if (!$user) {
                return response(['message' => 'user not found'], 422);
            }
            $profits = Profits::where('user_id', $request->user_id)->first();
            if (!$profits) {
                return response(['message' => 'you do not have yet'], 422);
            }
            $profits->rate_price = 0;
            $profits->pre_price = 0.;
            $profits->ads_price = 0.;
            $profits->total_price = 0.;
            $profits->save();
            return response($profits, 200);
        }
    }
    /*=========================== get banks accounts for site  ============================*/
    public function banks()
    {
        $banks =\App\Bank::all();
        return response( $banks, 200);
    }
    /*==============aboutUs==========*/
    public function about_ar(Request $request)
    {
        //check lang
        $ci = \App\Models\SiteText::where('id', 1)->first();
        return response($ci, 200);
    }public function about_en(Request $request)
    {
        //check lang
        $ci = \App\Models\SiteText::where('id', 2)->first();
        return response($ci, 200);
    }  public function condtions_ar(Request $request)
    {
        //check lang
        $ci = \App\Models\SiteText::where('id', 3)->first();
        return response($ci, 200);
    }public function condtions_en(Request $request)
    {
        //check lang
        $ci = \App\Models\SiteText::where('id', 4)->first();
        return response($ci, 200);
    }

    /*==============condtions==========*/
    public function rate(Request $request){
        $rules = [
            'form_id' => 'required',
            'to_id' => 'required',
            'rate' => 'required|numeric|in:1,2,3,4,5',
            'comment' => 'nullable',

        ];
        $validate = Validator::make(request()->all(), $rules, ['digits_between' => 'the phone number must be number no + in it']);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {


            $user = User::where('id', $request->form_id)->first();
            if (!$user) {
                return response(['message' => 'user not found '], 422);
            }
            $provider = User::where('id', $request->to_id)->first();
            if (!$provider) {
                return response(['message' => 'provider not found '], 422);
            }
            $rate=new Rate();
            $rate->form_id=$request->form_id;
            $rate->to_id=$request->to_id;
            $rate->rate=$request->rate;
            $rate->comment=$request->comment;
            $rate->save();
            return response($rate,200);


    }
 }
    public function like(Request $request){
        $rules = [
            'user_id' => 'required',
            'ad_id' => 'required',


        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);

        } else {


            $user = User::where('id', $request->user_id)->first();
            if (!$user) {
                return response(['message' => 'user not found '], 422);
            }
            $provider = Ad::where('id', $request->ad_id)->first();
            if (!$provider) {
                return response(['message' => 'ad not found '], 422);
            }
$l=Like::where(['user_id'=>$request->user_id,'ad_id'=>$request->ad_id])->first();
            if (!$l) {
                $like = new Like();
                $like->user_id = $request->user_id;
                $like->ad_id = $request->ad_id;
                $like->save();
                return response($like,200);
            } else {
                $l->delete();
                return response(['message'=>'like delete'],422);
            }



    }
 }
    public  function all_bank_accounts () {
        $all_bank_accounts=Bank::all();
        if($all_bank_accounts->count()==null){
            return response( "no bank exists",404);

        }
        return response($all_bank_accounts, 200);
    }
    public function all_categories (){
     $docs=Category::all();
     return response($docs,200);
    }  public function all_cities (){
     $docs=City::all();
     return response($docs,200);
    }
    public function all_products (){

     $docs=Product::with('productImages')->take(20)->get();
     $i=0;
     foreach ($docs as $d){
         if($d->user_id){
         $user=User::where('id',$d->user_id)->first();
         if($user){
             $d['user_name']=$user->name;

         }else{             $d['user_name']=null;
         }
             $d['user_name']=$user->name;
     }else{
             $d['user_name']=null;

         }
     }
     return response($docs,200);
    }
    public function height_sel_products (){
   $b=OrderDetail::orderBy('id','desc')->take(20)->pluck('product_id')->toArray();
     $docs=Product::whereIn('id',$b)->with('productImages')->take(20)->get();
     $i=0;
     foreach ($docs as $d){
         if($d->user_id){
         $user=User::where('id',$d->user_id)->first();
         if($user){
             $d['user_name']=$user->name;

         }else{             $d['user_name']=null;
         }
             $d['user_name']=$user->name;
     }else{
             $d['user_name']=null;

         }
     }
     return response($docs,200);
    }

public  function all_representatives(){
     $representatives=User::where('type',2)->get();
     return response($representatives,200);
}
    public function add_order(Request $request){
        $rules = [

            'user_id' => 'required',
            'representative_id' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',


            'orderDetalis' => 'required',


        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        $products=Product::pluck('id')->toArray();
        if(in_array($request->product_id,$products)){
            return response(['message'=>'product not found'],422);
        }
        $form=User::where('id',$request->user_id)->first();
        $to=User::where('id',$request->representative_id)->first();
        if(!$form){
            return response(['message'=>'user not found'],422);

        } if(!$to){
            return response(['message'=>'representative not found'],422);

        }
        $order=new Order();
        $order->user_id=$request->user_id;
        $order->latitude=$request->latitude;
        $order->longitude=$request->longitude;
        $order->address=$request->address;
        $order->representative_id=$request->representative_id;

        $order->save();
        if($request->orderDetalis){
            $detalis=$request->orderDetalis;
            foreach ($detalis as $d){
                $order=Order::orderBy('id','desc')->first();
                $product=Product::where('id',$d['product_id'])->first();
                $p=new OrderDetail();
                $p->order_id=$order->id;
                $p->product_id=$product->id;
                $p->amount=$d['amount'];
                $p->total=$d['amount']*$product->price;
                $p->save();


            }
            $amounts=OrderDetail::where('order_id',$order->id)->sum('amount');
            $totals=OrderDetail::where('order_id',$order->id)->sum('total');
            $order->amount+=$amounts;
            $order->total+=$totals;
            $order->save();
            $users=User::where('type',2)->get();

            foreach ($users as$u) {
                $not = new Notification();
                $not->from_id = $order->user_id;
                $not->to_id = $u->id;
                $not->notification_date = strtotime(now());
                $not->type = 1;
                $not->order_id = $order->id;
                $not->notification_name = 1;
                $not->save();

            }
            $admins=Admin::all();
            foreach ($admins as $admin){
                $not=new Notification();
                $not->from_id=$order->user_id;
                $not->to_id=$admin->id;
                $not->notification_date=strtotime(now());
                $not->type=1;
                $not->notification_name=1;
                $not->save();
            }
            return response($order,200);
        }


    }
    public  function payment(Request $request)
    {
        $rules = [


            'user_id' => 'required',
            'bank_id' => 'required',
            'amount' => 'required',
            'image' => 'required|image|mimes:jpeg,jpg,png,gif',


        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        $user = User::where('id', $request->user_id)->first();
        if ($user == null) {
            return response(['message' => ' user not found '], 422);
        }
        $bank = \App\Bank::where('id', $request->bank_id)->first();
        if (!$bank) {
            return response(['message' => ' bank not found '], 422);
        }
        if (!$request->hasFile('image')) {
            return response()->json(['upload_file_not_found'], 404);
        }//ckeck   avatar
        $payment = new Payment();
        $payment->user_id = $request->user_id;
        $payment->bank_id = $request->bank_id;
        $payment->amount = $request->amount;


        $image = $request->file('image');
        $imageName = time() . '.' . \request('image')->getClientOriginalExtension();

        $payment->image = 'uploads/payments/' . $imageName;
        $image->move('uploads/payments', $imageName);

        $payment->save();
        return response($payment,200);
    }
    public  function all_malls(Request $request){
        $rules = [


            'country_id' => 'nullable|numeric',



        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        if($request->country_id){   $dat=User::where('country_id',$request->country_id)->where('type',2)->get();
            return response($dat,200);}else{  $dat=User::where('type',2)->get();
            return response($dat,200);}

    }public  function
Auctions(){
        $dat=Ad::where('is_special',2)->get();
        return response($dat,200);
    }
    public  function all_sliders(){
        $dat=Slider::all();
        return response($dat,200);
    }
    public  function hight_views(Request $request){
        $rules = [


            'country_id' => 'nullable|numeric',



        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        if($request->country_id){ $dat=View::orderBy('id','desc')->take(20)->pluck('ad_id')->toArray();
            $ads=Ad::whereIn('id',$dat)->where('is_special','!=',2)->where('country_id',$request->country_id)->get();
            return response($ads,200);}else{ $dat=View::orderBy('id','desc')->take(20)->pluck('ad_id')->toArray();
            $ads=Ad::whereIn('id',$dat)->where('is_special','!=',2)->get();
            return response($ads,200);}

    }
    public  function add_offer(Request $request)
    {

        $rules = [


            'user_id' => 'required',
            'ad_id' => 'required',
            'price' => 'required',


        ];
        $validate = Validator::make(request()->all(), $rules);
        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        $user = User::where('id', $request->user_id)->first();
        if ($user == null) {
            return response(['message' => ' user not found '], 422);
        }
        $bank =Ad::where('id', $request->ad_id)->first();
        $deay=86400;
        if (!$bank) {
            return response(['message' => ' ad not found '], 422);
        }
        if (strtotime($bank->created_at)>(strtotime(now())-$deay)) {
            return response(['message' => ' ad closed '], 422);
        }

        $payment = new Offer();
        $payment->user_id = $request->user_id;
        $payment->ad_id = $request->ad_id;
        $payment->price = $request->price;
        $payment->date = strtotime(now());




        $payment->save();
        return response($payment,200);
    }
    public  function accept_offer(Request $request)
    {
        $rules = [


            'user_id' => 'required',
            'offer_id' => 'required',



        ];
        $validate = Validator::make(request()->all(), $rules);
        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        $user = User::where('id', $request->user_id)->first();
        if ($user == null) {
            return response(['message' => ' user not found '], 422);
        }
        $offer=Offer::where('id', $request->offer_id)->first();

        if (!$offer) {
            return response(['message' => ' offer not found '], 422);
        }
        $deay=86400;
        $bank =Ad::where('id', $offer->ad_id)->first();
        if (!$bank) {
            return response(['message' => ' ad not found '], 422);
        }
        if (strtotime($bank->created_at)<(strtotime(now())-$deay)) {
            return response(['message' => ' ad closed '], 422);
        }

       if($request->user_id==$bank->user_id){
           $offer->is_accepted=1;
           $offer->save();
           return response($offer,200);
       }else{
           return response(['message' => ' ad not for user  '], 422);
       }

        $payment->save();
        return response($payment,200);
    }
    public  function all_offer(Request $request)
    {
        $rules = [


            'ad_id' => 'required',


        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }

        $bank =Ad::where('id', $request->ad_id)->first();
        if (!$bank) {
            return response(['message' => ' ad not found '], 422);
        }

        $payment =Offer::where('ad_id',$request->ad_id)->get();
        $i=0;
        foreach ($payment as  $p){
            $user=User::where('id',$p->user_id)->first();

            if ($user) {
                $payment[$i]['user_name'] = $user->name;
                $payment[$i]['user_phone'] = $user->phone;
                $payment[$i]['user_image'] = $user->image;
            } else {
                $payment[$i]['user_name'] = null;
                $payment[$i]['user_phone'] = null;
                $payment[$i]['user_image'] = null;
            }
            $i++;
        }

        return response($payment,200);
    }
    public  function get_submall(Request $request)
    {
        $rules = [


            'perent_id' => 'required',


        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }

        $bank =User::where('id', $request->perent_id)->first();
        if (!$bank) {
            return response(['message' => ' mall not found '], 422);
        }

        $payment =  User::where('perent_id',$request->perent_id)->with('images')->get();


        return response($payment,200);
    }
    public function special(Request $request){
        $rules = [


            'country_id' => 'nullable|numeric',



        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        if($request->country_id){   $data=Ad::where('is_special',1)->where('country_id',$request->country_id)->get();
            return response($data,200);}else{   $data=Ad::where('is_special',1)->get();
            return response($data,200);}

    }  public function new_ads(){
        $week=strtotime('2020-06-14')-strtotime('2020-06-07');
          $now=strtotime(now())-$week;
          $nod = date('Y-m-d', $now);

    $data=Ad::where('created_at','>',$nod)->get();
        return response($data,200);
    }
    public  function  all_Jewelleries(){
        $jew=Jewellery::all();
        return response($jew,200);
    }
    public  function add_jewellery_order(Request $request)
    {
        $rules = [


            'user_id' => 'required',
            'jewellery_id' => 'required',
            'amount' => 'required',


        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        $user = User::where('id', $request->user_id)->first();
        if ($user == null) {
            return response(['message' => ' user not found '], 422);
        }
        $bank =Jewellery::where('id', $request->jewellery_id)->first();
        if (!$bank) {
            return response(['message' => ' jewellery  not found '], 422);
        }

        $payment = new JewelleryOrder();
        $payment->user_id = $request->user_id;
        $payment->jewellery_id= $request->jewellery_id;
        $payment->amount= $request->amount;




        $payment->save();
        $d=JewelleryWallet::where('user_id',$user->id)->first();
        if(!$d){
            $d=new JewelleryWallet();
            $d->user_id=$user->id;

            $d->amount=$bank->jewellery_value*$request->amount;
            $d->save();

        }else{
            $d->amount+=$bank->jewellery_value*$request->amount;
            $d->save();
        }
        return response($payment,200);
    }
    public  function my_jewellery_wallet(Request $request)
    {
        $rules = [


            'user_id' => 'required',


        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        $user = User::where('id', $request->user_id)->first();
        if ($user == null) {
            return response(['message' => ' user not found '], 422);
        }
       $orders=JewelleryWallet::where('user_id',$user->id)->first();
       if(!$orders){
           $orders=new JewelleryWallet();
           $orders->user_id=$user->id;
           $orders->save();

       }

        return response($orders,200);
    }
    public  function my_jewellery_order(Request $request)
    {
        $rules = [


            'user_id' => 'required',
            'type' => 'required',


        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        $user = User::where('id', $request->user_id)->first();
        if ($user == null) {
            return response(['message' => ' user not found '], 422);
        }
       $orders=JewelleryOrder::where('user_id',$user->id)->where('is_accepted',$request->type)->get();
        $jj=0;
        foreach ($orders as $order){
            $j=Jewellery::where('id',$order->jewellery_id)->first();
            if($j){
             $orders[$jj]['jewellery_ar_title']=$j->ar_title;
             $orders[$jj]['jewellery_en_title']=$j->en_title;
            }else{
                $orders[$jj]['jewellery_ar_title']=null;
                $orders[$jj]['jewellery_en_title']=null;
            }
            $jj++;
        }
        return response($orders,200);
    }
    public  function check_user(Request $request)
    {
        $rules = [


            'name' => 'nullable',
            'email' => 'nullable|email',
            'token' => 'nullable',



        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        if($request->token!=null){
        $user = User::where('remember_token', $request->token)->orWhere('name', $request->name)->orWhere('email', $request->email)->first();
        if ($user) {
            return response($user, 200);
        }}else{
            $user = User::Where('name', $request->name)->orWhere('email', $request->email)->first();
            if ($user) {
                return response($user, 200);
            }
        }
        $user_email = User::where('email', $request->email)->get();
        if ($user_email->count() != 0) {
            return response(['status' => false, 'message' => 'The email is already taken'], 422);

        }
      $u=new User();
        $u->name=$request->name;
        $u->email=$request->email;
        $u->remember_token=$request->token;

        $u->save();
        $y=User::orderBy('id','desc')->first();
        return response($y, 200);

    }
    public  function check_token(Request $request)
    {
        $rules = [



            'token' => 'required',



        ];
        $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {

            return response(['status' => false, 'message' => 'this is the all errors', 'errors' => $validate->messages()], 422);
        }
        $user = User::where('remember_token', $request->token)->first();
        if ($user) {
            return response($user, 200);
        }

        return response(['message'=>'use not found'], 422);

    }

}


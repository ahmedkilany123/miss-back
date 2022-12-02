<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use App\Models\Ad;
use App\Models\Follow;
use App\Models\Like;
use App\Models\UserMessage;
use App\Models\Country;
use App\Models\JewelleryWallet;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;

class ProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = Auth::user();

        if ($user){
            $Favorite=Like::where('user_id',$user->id)->pluck('ad_id')->toArray();
            $data['auctions']=Ad::where('is_special',2)->where('user_id',$user->id)->get();
            $data['favorites']=Ad::whereIn('id',$Favorite)->get();
            $data['countries']=Country::get();
            $uflo=Follow::where('follower_id',$user->id)->pluck('followed_id')->toArray();
            $data['followeds']=User::whereIn('id',$uflo)->get();
            $uflor=Follow::where('followed_id',$user->id)->pluck('follower_id')->toArray();
            $data['followers']=User::whereIn('id',$uflor)->get();


            $d=JewelleryWallet::where('user_id',$user->id)->first();
            if(!$d){
                $d=new JewelleryWallet();
                $d->user_id=$user->id;
                $d->save();
                $data['j']=$d;

            }else{
                $data['j']=$d;
            }
            $data['messages']=UserMessage::get();

            $data['ads']=Ad::where('is_special','!=',2)->where('user_id',$user->id)->get();
            $data['user']=User::where('id',$user->id)->first();
            return view('site.profile.myProfile',$data);

      }else{        return redirect(url('/'));
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[

            'phone' => 'required|numeric|digits_between:1,20',
            'email' => 'required|max:190',
        ]);       $user=User::where('id',Auth::user()->id)->first();
        if($request->image) {

            if ($user->image != null) {

            $usersImage = public_path("{$user->image}"); // get previous image from folder
            if (File::exists($usersImage)) { // unlink or remove previous image from folder
                unlink($usersImage);
            }
        }///delete pr avatar

            $image = $request->file('image');
            $imageName = 'uploads/users/' . time() . '.' . request()->image->getClientOriginalExtension();
            $user->image = $imageName;
            $image->move('uploads/users/', $imageName);
        }
        if($request->banner) {
        if ($user->banner != null) {

            $usersImage1 = public_path("{$user->banner}"); // get previous image from folder
            if (File::exists($usersImage1)) { // unlink or remove previous image from folder
                unlink($usersImage1);
            }
        }///delete pr avatar

            $image1 = $request->file('banner');
            $imageName1 = 'uploads/users/' .'2'. time() . '.' . request()->banner->getClientOriginalExtension();
            $user->banner = $imageName1;
            $image1->move('uploads/users/', $imageName1);
        }
        if ($request->password) {
            $user->password = bcrypt($request->password);
        }
        $user->phone = $request->phone;
        $user->email = $request->email;
        $user->name = $request->name;
         $user->save();
         return  back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user=User::find($id);
        if ($user){
            $Favorite=Like::where('user_id',$user->id)->pluck('ad_id')->toArray();
            $data['auctions']=Ad::where('is_special',2)->where('user_id',$user->id)->get();
            $data['favorites']=Ad::whereIn('id',$Favorite)->get();
            $data['countries']=Country::get();
            $data['ads']=Ad::where('is_special','!=',2)->where('user_id',$user->id)->get();
            $data['user']=User::where('id',$user->id)->first();
            $uflo=Follow::where('follower_id',$id)->pluck('followed_id')->toArray();
            $data['followeds']=User::whereIn('id',$uflo)->get();
            $uflor=Follow::where('followed_id',$id)->pluck('follower_id')->toArray();
            $data['followers']=User::whereIn('id',$uflor)->get();

            return view('site.profile.profile',$data);

        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

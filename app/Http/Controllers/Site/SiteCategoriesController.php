<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
;

use App\missing;
use Illuminate\Http\Request;


use App\Models\Country;
use App\SocialProvider;

use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Support\Facades\File;

use Carbon\Carbon;
use Laravel\Socialite\Facades\Socialite;
use Session;
use App\Http\GoogleMaps;
use App\User;
use Auth;

class SiteCategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

     return  view('site.categories.index');

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
        
       
          
        $admin=new missing();
        $admin->name=$request->name;
        $admin->email=$request->email;
        $admin->phone=$request->phone;
        $admin->info=$request->info;
        $admin->missing=$request->missing;
        $admin->city_id=$request->city_id;
        $admin->user_id=auth()->user()->id;



        if ($request->image){


            $image = $request->file('image');


            $imageName = time() . '.' .\request('image')->getClientOriginalExtension();
            $admin->image = 'missing/'.$imageName;
            $image->move('upload/missing', $imageName);
        }



        $admin->save();
        toastr()->success('تم الاضافة بنجاح','تم');

        return redirect(route('siteHome.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

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

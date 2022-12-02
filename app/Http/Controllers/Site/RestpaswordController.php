<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class RestpaswordController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
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
                return view('site.try',['user'=>$user]);

            }else{

                return view('site.notfound');


            }
        }


        return response([
            'messages' => 'Invalid phone or password',

        ], 404);



    }// validation

    public function index()
    {
        return view('site.reset');
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
    }public function reset(Request $request)
    {
     $user=User::where( 'id',$request->user_id)->first();
     if($user&&$request->password){
         $user->password = bcrypt($request->password);
         $user->save();
         Auth::login($user);
 return  redirect(route('siteHome.index'));
     }else{
         return back();
     }
    }
}

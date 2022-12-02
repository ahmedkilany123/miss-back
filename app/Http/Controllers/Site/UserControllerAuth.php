<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use App\Models\Country;
use App\SocialProvider;
use Illuminate\Http\Request;

use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Support\Facades\File;

use Carbon\Carbon;
use Laravel\Socialite\Facades\Socialite;
use Session;
use App\Http\GoogleMaps;
use App\User;
use Auth;

class UserControllerAuth extends Controller
{

    public function login() {
        return view('site.login');
    }
    public function dologin(Request $request)

    {
        $this->validate($request, [
            'phone'   => 'required',
            'password' => 'required|min:6'
        ]);
        $rememberme = request('rememberme') == 1?true:false;
        if (auth()->attempt(['phone' => request('phone'), 'password' => request('password')], $rememberme)) {
            toastr()->success('تم تسجيل الدخول بتجاح','تم');

            return redirect(url('/'));
        }elseif(auth()->attempt(['name' => request('phone'), 'password' => request('password')], $rememberme)){
            toastr()->success('تم تسجيل الدخول بتجاح','تم');

            return redirect(url('/'));
        } else {
            toastr()->error('المعلومات غير صحيحه');

            return redirect(url('loginSite'));
        }
    }
    public function Logout()
    {
        Auth::logout();
        return redirect()->route('login');
    }
    public function site_register (){
       $data['countries']=Country::all();

        return view('site.register',$data);

}
    public function SignUp(Request $request)
    {
        $this->validate($request,[


                'name' => 'required',
                'phone' => 'required|digits_between:1,20|unique:users',

                'password' => 'required|min:6',



            ]
        );


        $user = new User();
        $user->name = $request->name;


        $user->phone = $request->phone;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);

        $user->country_id = $request->country_id;


        $user->save();
        Session::flash('msg', '  تم انشاء الحساب بنجاح يرجى تفعيل حسابك');
        Auth::login($user);
        return redirect(url('/'));



    }
    public function redirectToProvider($provider)
    {
        return Socialite::driver($provider)->redirect();
    }


    /**
     * Obtain the user information from GitHub.
     *
     * @return Response
     */
    public function handleProviderCallback($provider)
    {
        try
        {
            $socialUser = Socialite::driver($provider)->user();
        }
        catch(\Exception $e)
        {
            return redirect('/loginSite');
        }
        //check if we have logged provider
        $socialProvider = SocialProvider::where('provider_id',$socialUser->getId())->first();
        if(!$socialProvider)
        {
            //create a new user and provider
            $user = User::firstOrCreate(
                ['email' => $socialUser->getEmail()],
                ['name' => $socialUser->getName()]
            );

            $user->socialProviders()->create(
                ['provider_id' => $socialUser->getId(), 'provider' => $provider]
            );

        }
        else
            $user = $socialProvider->user;

        auth()->login($user);

        return redirect('/');

    }
    protected function loginOrCreateAccount($providerUser, $driver) {

        // check for already has account
        $user = User::where('email', $providerUser->getEmail())->first();

// if user already found
        if( $user ) {
            // update the avatar and provider that might have changed
            $user->update([
                'avatar' => $providerUser->avatar,
                'provider' => $driver,
                'provider_id' => $providerUser->id,
                'access_token' => $providerUser->token
            ]);
        } else {
            if($providerUser->getEmail()){ //Check email exists or not. If exists create a new user
                $user = User::create([
                    'name' => $providerUser->getName(),
                    'email' => $providerUser->getEmail(),
                    'avatar' => $providerUser->getAvatar(),
                    'provider' => $driver,
                    'provider_id' => $providerUser->getId(),
                    'access_token' => $providerUser->token,
                    'password' => '' // user can use reset password to create a password
                ]);

            }else{

                //Show message here what you want to show

            }
        }

        // login the user
        Auth::login($user, true);
        return $this->sendSuccessResponse();
    }
    private function isProviderAllowed($driver)
    {
        return in_array($driver, $this->providers) && config()->has("services.{$driver}");
    }

}
